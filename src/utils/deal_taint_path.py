import os
import xml
import xml.dom
import xml.dom.minidom

from utils import utils
from utils.java_dalvik_bridge import create_types, java2dalvik_type, dalvik2java_type
from utils.exception import HaveException, ToolsException

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


def deal_amandroid_taint(data_path, apk_name):
    log.info("[+] deal the Amandroid taint path.")
    out_txt = os.path.join(data_path, apk_name, "result", "AppData.txt")
    if not os.path.exists(out_txt):
        log.error(f"[!] Amandroid analysis failed the apk {apk_name}.")
        raise ToolsException(f"[!] Amandroid failed to analyze apk {apk_name}.")

    taint_path_set = []
    with open(out_txt, "r") as f:
        lines = f.readlines()
        if "Discovered taint paths are listed below:" in str(lines[-1]):
            raise ToolsException(f"[!] Amandroid not find the apk {apk_name} TaintPath.")
        if "Taint analysis result:" in str(lines[-1]):
            raise ToolsException(f"[!] Amandroid not find the apk {apk_name} source and sink.")

        for k, v in enumerate(lines):
            if v.startswith("    TaintPath:"):
                source = lines[k + 1].split("_source: ")[1].split(">")[0]
                sink = lines[k + 2].split("_sink: ")[1].split(">")[0]
                taint_path_set.append(source + " ====> " + sink)
    return taint_path_set


def getcon_method(mth):
    return "<" + mth.split("<")[1].split(">")[0] + ">"


# get taint var index for flowdroid
def get_taint_var_index(parameter_list, taint_var):
    parameter_list = parameter_list[1:-1]
    if ", " not in parameter_list:
        if parameter_list == taint_var:
            return 1
        else:
            return 0
    else:
        for k, v in enumerate(parameter_list.split(", ")):
            if v == taint_var:
                return k + 1
        return 0


def deal_flowdroid_taint(flowdroid_folder, app_name):
    log.info("[+] deal the Flowdroid taint path.")
    leak_file = os.path.join(flowdroid_folder, app_name + "_leak.xml")
    if not os.path.exists(leak_file):
        log.error(f"[!] Flowdroid analysis failed the apk {app_name}.")
        raise ToolsException("[!] Flowdroid analysis failed.")

    x = os.path.getsize(leak_file)
    if x == 12:
        log.error("[!] Flowdroid analysis timeout.")
        raise ToolsException("[!] FlowDroid analysis timeout.")

    dom_tree = xml.dom.minidom.parse(leak_file)
    collection = dom_tree.documentElement
    results = collection.getElementsByTagName("Result")

    if not results:
        log.error("[!] results is empty.")
        raise ToolsException("[!] FlowDroid can't find the taint path.")

    taint_path_set = []
    for result in results:
        sources = result.childNodes[1].childNodes
        sink = result.childNodes[0]
        for source in sources:
            source_statement = source.getAttribute("Statement")
            sink_statement = sink.getAttribute("Statement")
            taint_par = sink.childNodes[0].getAttribute("Value")
            index = get_taint_var_index(sink_statement.split(">")[1], taint_par)

            taint_path = java2dalvik_type(getcon_method(source_statement)) + " ====> " + java2dalvik_type(
                getcon_method(sink_statement)) + " " + str(index)

            taint_path_set.append(taint_path)
    return taint_path_set


def deal_jnfuzz_test(outpath, decompile_path, app_name):
    scripts = os.path.join(outpath, "scripts")
    utils.create_floder(scripts)
    utils.create_floder(os.path.join(scripts, app_name))
    if (len(os.listdir(os.path.join(scripts, app_name)))) != 0:
        log.warning("[*] has been exec.")
    else:
        num = 0
        methods = utils.get_native_methods(decompile_path, app_name)
        for method in methods.split(","):
            y = method.split(" ")[0]
            state = method.split(" ")[1]
            files = utils.create_script_file(scripts, app_name, "t" + str(num))
            with open(files, "w") as f:
                f.write("jnfuzz-test\n")
                f.write("sequence:{" + y + " 0}\n")
                if state == "0":
                    f.write("method:" + y + " static\n")
                else:
                    f.write("method:" + y + " nostatic\n")
                f.write("{\n")
                for k, v in enumerate(create_types(method)[0]):
                    f.write("p" + str(k) + ":{is_tainted:false, value:default, type:" + v + "}\n")
                f.write("}\n")
                f.write("dependence{\n")
                f.write("}")
            num = num + 1


def deal_jucify_taint():
    return
