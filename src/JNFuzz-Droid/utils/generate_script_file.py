import os
import xml
import xml.dom
import xml.dom.minidom

from utils import utils, convertType
from utils.logging_config import setup_logging
from utils.utils import java2dalvik_type, get_type_index
from utils.deal_taint_path import get_taint_var_index, getcon_method

log = setup_logging(name=__name__)

depth = 10

""" generate the amandroid script """


# return dec
def bin2dec(b):
    d = 0
    for i, x in enumerate(b):
        d += 2 ** (-i - 1) * x
    return d


# deal double
def deal_double(value):
    format_value = format(int(value), '#066b')
    s = 1
    if format_value[2] == '1':
        s = -1
    e = format_value[3:14]
    p = int(e, 2) - 1023
    if p >= 0:
        z = format_value[14:14 + p]
        Inter = int(z, 2) + pow(2, p)
        m = format_value[14 + p:]
        list = []
        for i in m:
            list.append(int(i))
        decim = bin2dec(list)
        return_float = Inter + decim
        return format(return_float * s, ".6f")
    else:
        m = format_value[14:]
        list = []
        for i in range(abs(p) - 1):
            list.append(0)
        list.append(1)
        for i in m:
            list.append(int(i))
        return format(bin2dec(list) * s, ".6f")


# deal float
def deal_float(value):
    format_value = format(int(value), '#034b')
    s = 1
    if format_value[2] == '1':
        s = -1
    e = format_value[3:11]
    p = int(e, 2) - 127
    if p >= 0:
        z = format_value[11:11 + p]
        Inter = int(z, 2) + pow(2, p)
        m = format_value[11 + p:]
        list = []
        for i in m:
            list.append(int(i))
        decim = bin2dec(list)
        return_float = Inter + decim
        return format(return_float * s, ".6f")
    else:
        m = format_value[11:]
        list = []
        for i in range(abs(p) - 1):
            list.append(0)
        list.append(1)
        for i in m:
            list.append(int(i))
        return format(bin2dec(list) * s, ".6f")


# obatin the value
def get_value(ptype, defin):
    if ":= " in defin[1]:
        # if ":= " in defin[-1]:
        value = defin[1].split(":= ")[1].split(";")[0]
        if ptype == "boolean":
            if value == "0I":
                return "false"
            elif value == "1I":
                return "true"
            else:
                return "default"
        elif ptype == "char":
            if value.endswith("I"):
                return chr(int(value[:-1]))
            else:
                return "default"
        elif ptype == "float":
            if value.endswith("F"):
                return float(value[:-1])
            elif value.endswith("I"):
                return deal_float(value[:-1])
            else:
                return "default"
        elif ptype == "double":
            if value.endswith("F") or value.endswith("D"):
                return float(value[:-1])
            elif value.endswith("I"):
                return deal_float(value[:-1])
            else:
                return "default"
        elif ptype == "java.lang.String":
            if "@kind object" in value:
                if len(defin[1].split(r'"')) >= 2:
                    return defin[1].split(r'"')[1]
                else:
                    return "default"
            elif value.endswith("I"):
                return "default"
            else:
                return "default"
        elif ptype == "byte" or ptype == "short" or ptype == "int":
            if value.endswith("I"):
                return int(value[:-1])
            else:
                return "default"
        elif ptype == "long":
            if value.endswith("L"):
                return int(value[:-1])
            else:
                return "default"
        elif ptype == "boolean[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i == "0I":
                        str = str + "false, "
                    elif i == '1I':
                        str = str + "true, "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif ptype == "byte[]" or ptype == "short[]" or ptype == "int[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i.endswith("I"):
                        str = str + i[:-1] + ", "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif ptype == "char[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i.endswith("I"):
                        str = str + chr(int(i[:-1])) + ", "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif ptype == "long[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i.endswith("L"):
                        str = str + i[:-1] + ", "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif ptype == "float[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i.endswith("I"):
                        str = str + deal_float(i[:-1]) + ", "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif ptype == "double[]":
            if value.endswith("@kind object"):
                str = "["
                list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                for i in list:
                    if i.endswith("L"):
                        str = str + deal_double(i[:-1]) + ", "
                str = str[:-2] + "]"
                if str == "]":
                    return "default"
                else:
                    return str
            else:
                return "default"
        elif "[][]" in ptype:
            if value.endswith("@kind object"):
                if "(" in value and ")" in value:
                    str = "["
                    list = value.split(" @")[0].replace("(", "").replace(")", "").split(", ")
                    for i in list:
                        if i.endswith("I"):
                            str = str + i[:-1] + ", "
                    str = str[:-2] + "]"
                    if str == "]":
                        return "default"
                    else:
                        return str
                else:
                    return "default"
            else:
                return "default"
        else:
            return "default"
    else:
        return "default"


# display the graph
def display(graph):
    for k, v in graph.items():
        print("start---------------\n", k)
        print("------------------\n")
        for i in v:
            print(i)
        print("end---------------\n")
        print()


def validate_source(line):
    param = line.split(" ===> ")[0]
    # onActivityResult->sink
    # if ".onActivityResult:(IILandroid/content/Intent;)V" in param:
    #     return False
    if ".onNewIntent:(Landroid/content/Intent;)V" in param:
        return False
    if ".onHandleIntent:(Landroid/content/Intent;)V" in param:
        return False
    if ".findViewById:(I)Landroid/view/View;" in param:
        return False
    return True


def get_taintpath(data_path, apk_name, index):
    taintpath_list = []
    appdata_file = os.path.join(data_path, apk_name, "result", "AppData.txt")
    if os.path.exists(appdata_file):
        with open(appdata_file, "r") as f:
            lines = f.readlines()
            num, flag = 0, 0
            for k, v in enumerate(lines):
                if v.startswith("    TaintPath:"):
                    num += 1
                    if num == index:
                        taintpath_list.append(lines[k + 5].rstrip()[13:-1])
    else:
        log.error("AppData.txt not exists.")
    return taintpath_list


def find_jni(graph, params):
    list_jni = []
    for i in graph.keys():
        if params.split(" param")[0].strip() in i:
            list_jni.append(i)
    return list_jni


def deal_param(s, defin, typelist, params):
    para = s.split(";")[-1][1:]
    para_info = ""
    if int(para) > 0:
        para_info += "p" + para + ":{"
        ptype = typelist[0][int(para) - 1]
        if params == para:
            para_info += "is_tainted:true, value:default, "
        else:
            para_info += "is_tainted:false, value:" + str(get_value(ptype, defin)) + ", "
        para_info += "type:" + ptype + "}\n"
    return para_info


def depth_first_search(graph, jni_fun, file, flag):
    mtd_sig = jni_fun.split("@signature")[1].split("`")[1]
    params = jni_fun.split("param:")[1].strip()
    type_list = convertType.create_types(mtd_sig)
    dpd = []
    for s in find_jni(graph, jni_fun):
        stack, data, dep = [s], [s], 0
        while stack and dep <= depth:
            dep = dep + 1
            n = stack.pop()
            if n in graph.keys():
                nodes = graph[n]
                for i in nodes[::-1]:
                    if i not in data:
                        stack.append(i)
                        data.append(i)
            else:
                break
        dpd1 = deal_param(s, data, type_list, params)
        dpd.append(dpd1)

    with open(file, "a") as f:
        if flag == 1:
            f.write("method:" + mtd_sig + " static\n{\n")
        else:
            f.write("method:" + mtd_sig + " nostatic\n{\n")
        # if len(dpd) != 1:
        for i in dpd:
            f.write(i)
        f.write("}")


def find_dgg(jni, taintpath_list):
    sig = jni.split(" ")[0]
    par = "param: " + jni.split(" ")[1].rstrip()
    stat = taintpath_list[0].split(", #")[-1]
    if sig in stat and par in stat:
        return "#" + stat


def generate_amandroid_script(self, lst):
    if not lst:
        log.error("[!] amandroid does not have taint path.")
        return

    log.info("[+] Get the taint graph.")
    abspath = os.path.join(self.IDDGs_path, self.apkname + ".txt")
    if os.path.exists(abspath):
        graphs = {}
        with open(abspath, "r") as f:
            lines = f.readlines()
            for line in lines:
                parts = line.strip().split(" ====> ")
                if len(parts) == 2:
                    if not graphs.__contains__(parts[1]):
                        graphs[parts[1]] = []
                    graphs[parts[1]].append(parts[0])
        # display(graphs)

        utils.create_floder(self.Script_path)
        utils.create_floder(os.path.join(self.Script_path, self.apkname))

        unique_taint = set()
        for index, value in enumerate(lst):
            if validate_source(value) and value not in unique_taint:
                files = utils.create_script_file(self.Script_path, self.apkname)

                taint_source = value.split(" ====> ")[0]
                jni_methods = value.split(" ====> ")[1]
                with open(files, "a") as f1:
                    f1.write(taint_source + "\n")
                    seq = "sequence:{" + jni_methods.rstrip() + "}"
                    f1.write(seq + "\n")

                taint_path_list = get_taintpath(self.Data_path, self.apkname, index + 1)

                report_file = os.path.join(self.out_path, "report", self.apkname + ".txt")
                with open(report_file, "r") as f:
                    lines = f.readlines()
                    lists = lines[4].replace("native_method = ", "").split(",")
                    flag = -1
                    for list in lists:
                        if list.split(" ")[0] == jni_methods.split(" ")[0]:
                            flag = int(list.split(" ")[1])
                    if flag != -1:
                        jni_fun = find_dgg(jni_methods, taint_path_list)
                        if jni_fun:
                            depth_first_search(graphs, jni_fun, files, flag)
                unique_taint.add(value)
            else:
                log.warning("[*] the taint path is duplicated or the taint source is invalid.")

    else:
        log.error("[!] Can't find the apk's IDDG.")


""" generate the flowdroid script """


def generate_flowdroid_script(self, lst):
    if not lst:
        log.error("[!] flowdroid does not have taint path.")
        return

    log.info("[+] Generate flowdroid script.")
    utils.create_floder(self.Script_path)
    utils.create_floder(os.path.join(self.Script_path, self.apkname))

    leak_file = os.path.join(self.flowdroid_engine, self.apkname + "_leak.xml")

    dom_tree = xml.dom.minidom.parse(leak_file)
    collection = dom_tree.documentElement
    results = collection.getElementsByTagName("Result")

    for result in results:
        sources = result.childNodes[1].childNodes
        sink = result.childNodes[0]
        for source in sources:
            source_statement = source.getAttribute("Statement")
            sink_statement = sink.getAttribute("Statement")
            taint_par = sink.childNodes[0].getAttribute("Value")
            index = get_taint_var_index(sink_statement.split(">")[1], taint_par)

            para_list = get_type_index(sink_statement)

            files = utils.create_script_file(self.Script_path, self.apkname)
            with open(files, "w") as f:
                f.write(java2dalvik_type(getcon_method(source_statement)) + "\n")
                f.write("sequence:{" + java2dalvik_type(getcon_method(sink_statement)) + " " + str(index) + "}\n")

                if "staticinvoke" in sink_statement:
                    f.write("method:" + java2dalvik_type(getcon_method(sink_statement)) + " static\n")
                else:
                    f.write("method:" + java2dalvik_type(getcon_method(sink_statement)) + " nostatic\n")
                f.write("{\n")
                for i in para_list:
                    if i[0] == index:
                        f.write("p" + str(i[0]) + ":{is_tainted:true, value:default, type:" + i[1] + "}\n")
                    elif i[2].startswith("$"):
                        f.write("p" + str(i[0]) + ":{is_tainted:false, value:default, type:" + i[1] + "}\n")
                    else:
                        f.write("p" + str(i[0]) + ":{is_tainted:false, value:" + str(i[2]) + ", type:" + i[1] + "}\n")
                f.write("}")
                # f.write("dependence{\n")
                # f.write("}")
