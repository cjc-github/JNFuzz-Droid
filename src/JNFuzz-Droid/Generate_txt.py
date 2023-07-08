import copy
import logging
import os
import re
import sys

from utils import utils, convertType

depth = 10


# deep clone list
def clone_list(tmp_list):
    # tmp_list_copy=tmp_list[:]
    tmp_list_copy = copy.deepcopy(tmp_list)
    return tmp_list_copy


# display the graph
def display(graph):
    for k, v in graph.items():
        print("start---------------\n", k)
        print("------------------\n")
        for i in v:
            print(i)
        print("end---------------\n")
        print()


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
    return "default"


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
    return "default"


# return dec
def bin2dec(b):
    d = 0
    for i, x in enumerate(b):
        d += 2 ** (-i - 1) * x
    return d


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


def DFS(graph, jni_fun, file, flag):
    mtd_sig = jni_fun.split("@signature")[1].split("`")[1]
    params = jni_fun.split("param:")[1].strip()
    typelist = convertType.create_types(mtd_sig)
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
        # print("297",data,"\n\n")
        dpd1 = deal_param(s, data, typelist, params)
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
    f.close()


def create_script_folder(output, filename):
    script = os.path.join(output, "scripts")
    if not os.path.exists(script):
        os.mkdir(script)
    script_folder = os.path.join(script, filename)
    if not os.path.exists(script_folder):
        os.mkdir(script_folder)


def create_script_file(output, filename, Num):
    folder = os.path.join(output, "scripts", filename)
    if os.path.exists(folder):
        file = os.path.join(folder, "script_" + str(Num) + ".txt")
        f = open(file, "w")
        f.close()
    else:
        logging.warning("can't find the script folder.")
    return file


def judge_nosource(line):
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


def find_dgg(jni, taintpath_list):
    # path_list = re.split(r",(?![^(]*\))", taintpath_list)
    sig = jni.split(" ")[0]
    par = "param: " + jni.split(" ")[1].rstrip()
    stat = taintpath_list[0].split(", #")[-1]
    if sig in stat and par in stat:
        return "#" + stat
    # for n in taintpath_list[0].split(", "):
    #     if sig in n and par in n:
    #         return n


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
        f.close()
    else:
        print("error: AppData.txt not exists")
    return taintpath_list


class Generate_txt:
    def __init__(self, apk_path, out_path):
        self.apk_path = apk_path
        self.apkname = utils.get_apkname(apk_path)
        self.out_path = out_path
        self.IDDGs_path = out_path + "/IDDGs"
        self.Data_path = out_path + "/Data"
        self.Script_path = out_path + "/scripts"

    def getgraph(self):
        if not utils.judge_input(self.apk_path):
            print(" [*] the input_apk is not exist.")
            exit(0)

        print(" [+] Get the taint graph.")
        abspath = os.path.join(self.IDDGs_path, self.apkname + ".txt")
        if os.path.exists(abspath):
            graphs = {}
            with open(abspath, "r") as f:
                lines = f.readlines()
                for i in lines:
                    if len(i.split(" ====> ")) == 2:
                        key = i.split(" ====> ")[1].rstrip()
                        value = i.split(" ====> ")[0].rstrip()
                        if not graphs.__contains__(key):
                            graphs[key] = []
                        graphs[key].append(value)
            f.close()

            # display(graphs)

            # taintpath_list = get_taintpath(self.Data_path, self.apkname)
            taint_path = os.path.join(self.Data_path, self.apkname, "result", "Taint.txt")
            utils.create_floder(self.Script_path)
            utils.create_floder(os.path.join(self.Script_path, self.apkname))

            if os.path.exists(taint_path):
                with open(taint_path, "r") as f:
                    taint_lines = f.readlines()
                    orig_num, num, unique_taint = 0, 0, set()
                    for index, line in enumerate(taint_lines):
                        if line not in unique_taint:
                            if judge_nosource(line):
                                orig_num += 1
                                num += 1
                                files = utils.create_script_file(self.Script_path, self.apkname, num)

                                taint_source = line.split(" ===> ")[0]
                                jni_methods = line.split(" ===> ")[1]
                                with open(files, "a") as f1:
                                    f1.write(taint_source + "\n")
                                    seq = "sequence:{" + jni_methods.rstrip() + "}"
                                    f1.write(seq + "\n")
                                f1.close()

                                taintpath_list = get_taintpath(self.Data_path, self.apkname, orig_num)

                                report_file = os.path.join(self.out_path, "report", self.apkname + ".txt")
                                with open(report_file, "r") as f:
                                    lines = f.readlines()
                                f.close()
                                lists = lines[4].replace("native_method = ", "").split(",")
                                flag = -1
                                for list in lists:
                                    if list.split(" ")[0] == jni_methods.split(" ")[0]:
                                        flag = int(list.split(" ")[1])
                                if flag != -1:
                                    jni_fun = find_dgg(jni_methods, taintpath_list)
                                    if jni_fun:
                                        DFS(graphs, jni_fun, files, flag)
                                unique_taint.add(line)
                            else:
                                orig_num += 1
                                print(" [*] no consider this source")
                        else:
                            orig_num += 1
                            print(" [*] This taint path is not unique")
                f.close()
        else:
            print(" [!] Can't find the apk's IDDG.")


if __name__ == "__main__":
    # python Generate_txt.py apk/Native1.apk out
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    gener = Generate_txt(apk_path, out_paths)
    gener.getgraph()
