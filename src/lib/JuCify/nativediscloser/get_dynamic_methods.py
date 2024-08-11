import os
import sys
import argparse
import tempfile
import multiprocessing as mp
import angr
import logging
from androguard.misc import AnalyzeAPK

from import_implementations import hookAllImportSymbols
from jni_interfaces.record import Record
from jni_interfaces.utils import (record_static_jni_functions, clean_records,
                                  record_dynamic_jni_functions, print_records, analyze_jni_function,
                                  jni_env_prepare_in_object, JNI_LOADER)

ANGR_RETDEC_OFFSET = 4194305

# the longest time in seconds to analyze 1 JNI function.
WAIT_TIME = 180
# the longest time in seconds for dynamic registration analysis
DYNAMIC_ANALYSIS_TIME = 600

# Directory for different ABIs, refer to: https://developer.android.com/ndk/guides/abis
ABI_DIRS = ['lib/armeabi-v7a/', 'lib/arm64-v8a/', 'lib/x86/', 'lib/x86_64/', 'lib/armeabi/', 'lib/mips/', 'lib/mips64/']

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


def parse_args():
    desc = 'Analysis APk to get the Dynamic Functions'
    parser = argparse.ArgumentParser(description=desc)
    parser.add_argument('apk', type=str, help='directory to the APK file')
    parser.add_argument('--out', type=str, default=None, help='the output directory')
    args = parser.parse_args()
    if not os.path.exists(args.apk):
        print('APK file does not exist!', file=sys.stderr)
        sys.exit(-1)
    if args.out is None:
        # output locally with the same name of the apk.
        args.out = '.'
    basename = os.path.basename(args.apk)
    without_extension = os.path.splitext(basename)[0]
    result_dir = f"{without_extension}_Dmethods"
    out = os.path.join(args.out, result_dir)
    if not os.path.exists(out):
        os.makedirs(out)
    return args.apk, out


def select_abi_dir(dir_list):
    selected = None
    abis = set()
    for n in dir_list:
        if n.startswith('lib/'):
            abis.add(n.split('/')[1])
    for abi_dir in ABI_DIRS:
        abi = abi_dir.split('/')[1]
        if abi in abis:
            selected = abi_dir
            break
    return selected


def get_return_address(state):
    return_addr = None
    arch = state.arch.name
    # for ARM, ARM64, get it from lr (i.e., link register) register.
    if 'ARMEL' in arch or 'AARCH64' in arch:
        return_addr = state.solver.eval(state.regs.lr)
    # for MIPS, get it from ra (i.e., return address) register.
    elif 'MIPS' in arch:
        return_addr = state.solver.eval(state.regs.ra)
    # for x86 or x86_64, the return address is stored on the stack which is pointed by the esp register.
    elif 'X86' in arch or 'AMD64' in arch:
        return_addr = state.memory.load(state.regs.esp, state.arch.bytes, endness=state.arch.memory_endness)
        return_addr = state.solver.eval(return_addr)
    else:
        logger.warning(f'Retrieve return address of architecture {state.arch.name} has not been implemented!')
    return return_addr


def cg_addr_hook(state):
    addr = state.addr
    func_info = state.globals.get('func_info')
    func_stack = state.globals.get('func_stack')
    if len(func_stack) == 0:
        # entering a tracking function
        func = find_func(addr, func_info, 'enter')
        if func is not None:
            logger.debug(f'enter func: {func}')
            func_stack.append(func)
            info = func_info.get(func)
            # appending and hooking func ending address for judging exiting of the func.
            return_addr = get_return_address(state)
            info.append(return_addr)
            # as func_info is a dict proxy, the list object have always to be updated.
            func_info.update({func: info})
            state.project.hook(return_addr, hook=cg_addr_hook)
    else:
        # check if exiting current function
        addrs = func_info.get(func_stack[-1])
        if len(addrs) == 2 and addrs[1] == addr:
            exit_func = func_stack.pop()
            logger.debug(f'exit func: {exit_func}')
        # check if enterring a new function
        func = find_func(addr, func_info, 'enter')
        if func is not None:
            logger.debug(f'enter func: {func}')
            func_stack.append(func)
            info = func_info.get(func)
            # appending and hooking func ending address for judging exiting of the func.
            return_addr = get_return_address(state)
            info.append(return_addr)
            # as func_info is a dict proxy, the list object have always to be updated.
            func_info.update({func: info})
            state.project.hook(return_addr, hook=cg_addr_hook)


def find_func(addr, f_info, addr_type):
    types = ('enter', 'exit')
    the_func = None
    if not addr_type in types:
        logger.warning(f'"find_func" does not support the "addr_type": {addr_type}!')
        return the_func
    for func, addrs in f_info.items():
        if addr_type == types[0]:
            func_addr = addrs[0]
        else:
            func_addr = addrs[1] if len(addrs) == 2 else None
        if addr == func_addr:
            the_func = func
            break
    return the_func


def get_function_addresses(proj, output_cg=False, path=None):
    funcs_addrs = list()

    cfg = proj.analyses.CFGFast()
    # cfg = proj.analyses.CFGEmulated(keep_state=True)
    for addr in cfg.functions:
        f = cfg.functions[addr]
        if not f.is_simprocedure and not f.is_syscall and not f.is_plt and not proj.is_hooked(addr):
            funcs_addrs.append((f.name, addr))
    return (funcs_addrs, cfg)


def print_dynamic_records(fname=None):
    if len(Record.RECORDS) > 0:
        f = None
        if fname is None:
            f = sys.stdout
        else:
            f = open(fname, 'w')
        for _, r in Record.RECORDS.items():
            print(r, file=f)
        if fname is not None:
            f.close()


def apk_run(path, out=None, comprise=False):
    if out is None:
        result_dir = path.split('/')[-1].rstrip('.apk') + '_result'
        out = os.path.join(".", result_dir)
        if not os.path.exists(out):
            os.makedirs(out)
    apk, _, dex = AnalyzeAPK(path)
    with apk.zip as zf, tempfile.TemporaryDirectory() as tmpd:
        chosen_abi_dir = select_abi_dir(zf.namelist())
        if chosen_abi_dir is None:
            logger.debug(f'No ABI directories were found for .so file in {path}')
            return
        logger.debug(f'Use shared library (i.e., .so) files from {chosen_abi_dir}')
        for n in zf.namelist():
            if n.endswith('.so') and n.startswith(chosen_abi_dir):
                logger.debug(f'Start to analyze {n}')
                so_file = zf.extract(n, path=tmpd)
                with mp.Manager() as mgr:
                    find_all_jni_functions(n, so_file, dex)


def find_all_jni_functions(n, so_file, dex):
    try:
        proj = angr.Project(so_file, auto_load_libs=False)
    except Exception as e:
        logger.warning(f'{so_file} cause angr loading error: {e}')
    else:
        hookAllImportSymbols(proj)
        jvm_ptr, jenv_ptr = jni_env_prepare_in_object(proj)
        clean_records()
        record_static_jni_functions(proj, dex)
        # print(proj.loader.main_object.imports)
        # find the jni_OnLoad function
        if proj.loader.find_symbol(JNI_LOADER):
            # wrap the analysis with its own process to limit the analysis time.
            with mp.Manager() as mgr:
                records = mgr.dict()
                p = mp.Process(target=record_dynamic_jni_functions,
                               args=(*(proj, jvm_ptr, jenv_ptr, dex, records),))
                p.start()
                p.join(DYNAMIC_ANALYSIS_TIME)
                if p.is_alive():
                    p.terminate()
                    p.join()
                    logger.warning('Timeout when analyzing dynamic registration')
                Record.RECORDS.update(records)

                file_name = n.split('/')[-1] + '.result'
                print_dynamic_records(os.path.join(out, file_name))


if __name__ == '__main__':
    # apk out cg
    path_2_apk, out = parse_args()
    # 运行
    apk_run(path_2_apk, out)
