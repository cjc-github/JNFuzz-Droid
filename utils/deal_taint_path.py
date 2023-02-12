import os
import xml

from utils import utils
from utils.convertType import create_types
from utils.exception import HaveException, ToolsException
from utils.utils import changeAmdtoFlow, changeFlowtoAmd, get_type_index


def nocomplex(line):
    str1 = line.split("(")[1].split(">")[0]. \
        replace("Ljava/lang/String;", "T"). \
        replace("Ljava/lang/Byte;", "B"). \
        replace("Ljava/lang/Short;", "S"). \
        replace("Ljava/lang/Integer;", "I"). \
        replace("Ljava/lang/Long;", "J"). \
        replace("Ljava/lang/float;", "F"). \
        replace("Ljava/lang/Double;", "D"). \
        replace("Ljava/lang/Boolean;", "B"). \
        replace("Ljava/lang/Character;", "C")
    if "/" in str1:
        return False
    return True

def othersink(param):
    # if int(param[-4:-2]) == 0:
    if int(param.split(" ")[-1][:-2]) == 0:
        return False
    return True

def iscomplex(args_appdata):
    list = []
    with open(args_appdata, "r") as f:
        lines = f.readlines()
        flag = 1
        for line in lines:
            if flag == 0 and line.strip():
                list.append(line)
            if "Discovered taint paths are listed below:" in line:
                flag = 0
    f.close()

    print("    [-] generate the taint.txt")
    taint_txt = args_appdata.replace("AppData.txt", "Taint.txt")
    with open(taint_txt, "w") as f:
        for i in list:
            f.write(i)
    f.close()
    # num = 0
    # for _ in list:
    #     num = num + 1
    #     if num % 6 == 3:
    #         # if nocomplex(line) and othersource(list[num - 2]) and othersink(list[num - 1]):
    #         # if othersource(list[num - 2]) and othersink(list[num - 1]):
    #         for s in list[num - 3:num + 3]:
    #             f.write(s)


def deal_Amandroid_taint(data_path, apk_name):
    print("  [-] deal the amandroid taint path")
    args_data = os.path.join(data_path, apk_name)
    if os.path.exists(args_data):
        args_data_result = os.path.join(args_data, "result")
        if not os.path.exists(args_data_result):
            raise ToolsException(" [+] " + apk_name + " \n Amandroid not generate the result folder.")
        else:
            args_appdata = os.path.join(args_data_result, "AppData.txt")
            if not os.path.exists(args_appdata):
                raise ToolsException(" [+] " + apk_name + " \n Amandroid not generate the AppData.txt.")
            else:
                with open(args_appdata, "r") as f:
                    lines = f.readlines()
                    last_line = lines[-1]
                    if "Discovered taint paths are listed below:" in str(last_line):
                        raise ToolsException(" [+] " + apk_name + " \n Amandroid not find the taintpath.")
                    elif "Taint analysis result:" in str(last_line):
                        raise ToolsException(" [+]" + apk_name + " \n Amandroidnot find the source and sink.")
                f.close()
                # have outcome
                iscomplex(args_appdata)
    else:
        raise ToolsException(" [+] " + apk_name + " \n Amandroid not analysis.")

def deal_jucify_taint():
    return


def getcon_method(mth):
    return "<" + mth.split("<")[1].split(">")[0] + ">"


def getcon_para(paras, taint_paras):
    if ", " not in paras:
        if paras[1:-1] == taint_paras:
            return 1
        else:
            return 0
    else:
        for k, v in enumerate(paras[1:-1].split(", ")):
            if v == taint_paras:
                return k + 1
        return 0
    return 0


def deal_flowdroid_taint(flowdroid_folder, app_name):
    leak_file = os.path.join(flowdroid_folder, app_name + "_leak.xml")
    if not os.path.exists(leak_file):
        print(" [*] Flowdroid analysis failed.")
        raise HaveException("FlowDroid analysis failed.")
    else:
        x = os.path.getsize(leak_file)
        if x == 12:
            print(" [*] Flowdroid analysis timeout")
            raise HaveException("FlowDroid analysis timeout.")
        else:
            DOMTree = xml.dom.minidom.parse(leak_file)
            collection = DOMTree.documentElement
            Results = collection.getElementsByTagName("Result")
            if not Results:
                print(" [*] Results is empty")
                raise HaveException("FlowDroid can't find the taint path")
            else:
                taintlist = []
                file = os.path.join(flowdroid_folder.rsplit("/", 1)[0], "Data", app_name, "result", "Taint.txt")
                if not os.path.exists(file):
                    print(" [*] Amandroid Taint is empty")
                    # raise HaveException("Amandroid don't have the taint path")
                else:
                    with open(file, "r") as f:
                        lines = f.readlines()
                    f.close()

                    for line in lines:
                        Asource = line.split("===>")[0].strip()
                        Asink = line.split("===>")[1].strip()
                        Apar = line.rsplit(" ", 1)[1].strip()
                        if "|" in Apar:
                            par_init = Apar.split("|")
                            for par_int in par_init:
                                tmp = [changeAmdtoFlow(Asource), changeAmdtoFlow(Asink), int(par_int)]
                        else:
                            tmp = [changeAmdtoFlow(Asource), changeAmdtoFlow(Asink), int(Apar)]
                        taintlist.append(tmp)

                scripts = os.path.join(flowdroid_folder.rsplit("/", 1)[0], "scripts")
                utils.create_floder(scripts)
                utils.create_floder(os.path.join(scripts, app_name))
                num = len(os.listdir(os.path.join(scripts, app_name)))

                for result in Results:
                    Sources = result.childNodes[1].childNodes
                    Sink = result.childNodes[0]
                    for Source in Sources:
                        con_source = Source.getAttribute("Statement")
                        con_sink = Sink.getAttribute("Statement")
                        con_taint_par = Sink.childNodes[0].getAttribute("Value")
                        flag = 0
                        for tl in taintlist:
                            if tl[0] == getcon_method(con_source) and tl[1] == getcon_method(con_sink) \
                                    and tl[2] == getcon_para(con_sink.split(">")[1], con_taint_par):
                                flag = 1
                                print(" [*][*][*] The path is common the Amandroid.\n\n\n")
                                # raise HaveException("The path is common of Amandroid and FlowDroid.")
                        if flag == 0:
                            x = changeFlowtoAmd(getcon_method(con_source))
                            y = changeFlowtoAmd(getcon_method(con_sink))
                            z = getcon_para(con_sink.split(">")[1], con_taint_par)
                            num = num + 1

                            files = utils.create_script_file(scripts, app_name, "f" + str(num))
                            # files = utils.create_script_file(scripts, app_name, str(num))
                            para_list = get_type_index(con_sink)

                            with open(files, "w") as f:
                                f.write(x + "\n")
                                f.write("sequence:{" + y + " " + str(z) + "}\n")
                                if " staticinvoke " in con_source:
                                    f.write("method:" + y + " static\n")
                                else:
                                    f.write("method:" + y + " nostatic\n")
                                f.write("{\n")
                                for i in para_list:
                                    if i[0] == z:
                                        f.write(
                                            "p" + str(i[0]) + ":{is_tainted:true, value:default, type:" + i[1] + "}\n")
                                    else:
                                        if i[2].startswith("$"):
                                            f.write("p" + str(i[0]) + ":{is_tainted:false, value:default, type:" + i[
                                                1] + "}\n")
                                        else:
                                            f.write(
                                                "p" + str(i[0]) + ":{is_tainted:false, value:" + str(i[2]) + ", type:" +
                                                i[
                                                    1] + "}\n")
                                f.write("}\n")
                                f.write("dependence{\n")
                                f.write("}")
                            f.close()


# run the jnfuzz testing
def deal_jnfuzz_test(outpath, decompile_path, app_name):
    scripts = os.path.join(outpath, "scripts")
    utils.create_floder(scripts)
    utils.create_floder(os.path.join(scripts, app_name))
    # judge the empty
    if (len(os.listdir(os.path.join(scripts, app_name)))) != 0:
        print("[+] exec even.")
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
            f.close()
            num = num + 1
