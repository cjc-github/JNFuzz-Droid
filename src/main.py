import os
import sys
import argparse

from Prepare_frida import pre_frida
from Preprocess import Preprocess
from Continue_process import ContinueProcess
from Fuzz_and_taint_analysis import Fuzz_and_taint_analysis

from utils import utils
from utils.logging_config import setup_logging
from utils.exception import ToolsException, HaveException


log = setup_logging(name=__name__)


# The log file is emptied before each execution
def empty_log(log_name):
    # if os.path.exists(log_name):
    #     os.remove(log_name)
    #     warn(f"The log file {log_name} has been deleted.")
    # else:
    #     info(f"The log file {log_name} does not exist.")
    with open(log_name, "w"):
        pass

# return the apk list
def deal_apk_folder(apk_path):
    apk_list = []
    if not os.path.exists(apk_path):
        log.error("[!] the folder is not exists.")
        sys.exit(0)
    elif not os.listdir(apk_path):
        log.error("[!] the folder is empty.")
        sys.exit(1)
    for name in os.listdir(apk_path):
        app_path = os.path.join(apk_path, name)
        re = utils.deal_apk(app_path)
        apk_list.append(re)
    return apk_list


if __name__ == '__main__':
    log_name = "jnfuzz-droid.log"
    empty_log(log_name)

    log.info("[+] ===Welcome to using Android Native Code Analysis.====\n")
    Title = "[+] Welcome to using Android Native Code Analysis."
    parser = argparse.ArgumentParser(description=Title)
    parser.add_argument("--i", "-i", default="apk", help="input dir.") # default: apk
    parser.add_argument("--o", "-o", default="apk_out", help="output dir.") # default: apk_out

    parser.add_argument("-arch", help="Specified cpu architecture.",
                        choices=['armeabi', 'armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64']) # default: None

    parser.add_argument("-a", help='using Amandroid enhance the static analysis.', action="store_true") # default: False
    parser.add_argument("-f", help='using Flowdroid enhance the static analysis.', action="store_true") # default: False
    # parser.add_argument("-j", help='using jucify enhance the static analysis.', action="store_true")
    # parser.add_argument("-u", help='using jnfuzz testing analysis.', action="store_true")

    parser.add_argument("-r", help="remove apk information.", action="store_true") # default: False
    
    parser.add_argument("-n", help="Fuzz only one time.", action="store_true") # default: False

    parser.add_argument("-d", help="display the process execution on another terminal.", action="store_true") # default: False

    # default time is 90 minutes
    parser.add_argument("-st", default=5400, type=int, help="the max static analysis time (sec).") # default: 5400s
    # default time is 10 minutes
    parser.add_argument("-t", default=600, type=int, help="the max fuzzing time (sec).") # default: 600s
    args = parser.parse_args() 
    

    apk_lists = deal_apk_folder(args.i)
    out_folder = args.o
    assert args.a or args.f or args.j or args.u, "-a or -f options is must"

    try:
        log.info("[+]  Step1/Step4 >>> Frida service start...")
        status = False
        # status = True
        if not status:
            pre_frida(args.arch)
    except Exception as e:
        log.error(f"[!] error: {e}.")
        sys.exit(1)

    for apk in apk_lists:
        try:
            log.info("[+] Step2/Step4 >>> Prepare deal the apk: " + apk)
            pre_deal = Preprocess(apk, out_folder, args.r)
            pre_deal.apktool()
            pre_deal.result()
            pre_deal.report()

            log.info("[+] Step3/Step4 >>> Continue deal the apk: " + apk)
            pre_analysis = ContinueProcess(apk, out_folder, args.st, args.r)
            pre_analysis.get_dynamic_methods()

            if args.a:
                pre_analysis.taint_amandroid()
            if args.f:
                log.info("[+] Enhance: launch the enhance engine for FlowDroid.")
                pre_analysis.taint_flowdroid()
            # Under development
            # if args.j:
            #     log.info("[+] Enhance: launch the enhance engine for Jucify")
            #     pre_analysis.taint_jucify()
            # Under development
            # if args.u:
            #     log.info("[+] using jnfuzz testing analysis")
            #     pre_analysis.jnfuzz_test()

            pre_analysis.save_taint_path()
            log.info("[+] Continue finish.\n")

            log.info("[+] Step4/Step4 Launch avd or devices.")
            fuzz = Fuzz_and_taint_analysis(apk, out_folder, args.arch, args.n, args.t, args.d)
            fuzz.select_arch()
            fuzz.fuzz_jni()
        except ToolsException as e:
            # skip the current apk
            log.warning(f"[*] Skip the current apk: {apk}.")
            utils.save_file(out_folder, e.error_info)
            continue
        except HaveException as e:
            log.error(e)
            # interrupt
            break
        log.info("[+] done.")
    else:
        log.info("[+] Finish.")
