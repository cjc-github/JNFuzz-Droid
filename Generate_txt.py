import copy
import logging
import os
import re
import sys

from utils import utils, convertType

depth = 30


# 复制列表
def clone_list(tmp_list):
    # tmp_list_copy=tmp_list[:]
    tmp_list_copy = copy.deepcopy(tmp_list)
    return tmp_list_copy


# 打印出图
def display(graph):
    for k, v in graph.items():
        print("start---------------\n", k)
        print("------------------\n")
        for i in v:
            print(i)
        print("end---------------\n")
        print()


# 根据jni函数找到具体的keys
def find_jni(graph, params):
    list_jni = []
    for i in graph.keys():
        if params.split(" param")[0].strip() in i:
            list_jni.append(i)
    return list_jni


# 如果是由前的jni造成的，则标记为noJudge
def isnojudge(jni_method, defin):
    for i in jni_method:
        jni = i.split(" ")[0]
        for j in defin:
            if jni in j:
                return True
    return False


# 处理双精度浮点型
def deal_double(value):
    # 由于前置0可以省略，所以需要判断位数
    format_value = format(int(value), '#066b')
    s = 1
    if format_value[2] == '1':
        s = -1
    # 指数部分
    e = format_value[3:14]
    # 偏移值
    p = int(e, 2) - 1023
    if p >= 0:
        # 指数部分求整数部分
        z = format_value[14:14 + p]
        Inter = int(z, 2) + pow(2, p)
        # 尾数部分求小数部分
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


# 处理浮点型
def deal_float(value):
    # 由于前置0可以省略，所以需要判断位数
    format_value = format(int(value), '#034b')
    s = 1
    if format_value[2] == '1':
        s = -1
    # 指数部分
    e = format_value[3:11]
    # 偏移值
    p = int(e, 2) - 127
    if p >= 0:
        # 指数部分求整数部分
        z = format_value[11:11 + p]
        Inter = int(z, 2) + pow(2, p)
        # 尾数部分求小数部分
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


# 返回小数
def bin2dec(b):
    d = 0
    for i, x in enumerate(b):
        d += 2 ** (-i - 1) * x
    return d


# 根据深度遍历得到的路径+类型，然后获取初始值
def get_value(ptype, defin):
    if ":= " in defin[-1]:
        value = defin[-1].split(":= ")[1].split(";")[0]
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
                # 浮点型的存储问题
            else:
                return "default"
        elif ptype == "double":
            if value.endswith("F") or value.endswith("D"):
                return float(value[:-1])
            elif value.endswith("I"):
                # double类型的存储问题
                return deal_float(value[:-1])
            else:
                return "default"
        elif ptype == "java.lang.String":
            if "@kind object" in value:
                if len(defin[-1].split(r'"')) >= 2:
                    return defin[-1].split(r'"')[1]
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


# 如果不在jni中，则为false
# 如果s存在jni路径中，则为True
def notaintpara(methods, s, para):
    current_method = s.split("@signature")[1].split("`")[1]
    for method in methods:
        if current_method in method:
            taint_paras = method.split(" ")[1].strip()
            for i in taint_paras.split("|"):
                if para == i:
                    return True
    return False


# 获取每个参数的初值
# jni_methods为所有的jni函数，jni_method为排除这个的jni函数
'''
jni_methods:Taint Path
index: the jni index
s:the jawa statement
defin:iddg
file:scirpt.txt
typelist:jni参数类型
'''


# 判断是否为污点
def isFirst(jni_methods, s):
    method = jni_methods[0]
    current_method = s.split("@signature")[1].split("`")[1]
    if current_method in method:
        return True
    return False


# 获取每个参数的初值
# jni_methods为所有的jni函数，jni_method为排除这个的jni函数
def deal_param(jni_methods, index, s, defin, file, typelist, params):
    # print("325", jni_methods)
    dpd = ""
    para = s.split(";")[-1][1:]
    # print("327", s, para)
    # if int(para) == 0:
    #    ptype = typelist[1]
    #    add_data_tofile(file, "type:" + ptype + "\n")
    # print("328",defin)
    if int(para) > 0:
        add_data_tofile(file, "p" + para + ":{")
        ptype = typelist[0][int(para) - 1]
        # 第二个jni函数开始，就不判断为true了
        if params == para and index == 0:
            add_data_tofile(file, "is_tainted:true, ")
            add_data_tofile(file, "value:default, ")
        elif params == para:
            add_data_tofile(file, "is_tainted:noJudge, ")
            add_data_tofile(file, "value:default, ")
        # elif not notaintpara(jni_methods, s, para):
        #     add_data_tofile(file, "is_tainted:false, ")
        #     add_data_tofile(file, "value:" + str(get_value(ptype, defin)) + ", ")
        #     dpd = s + "===>" + defin[-1]
        # elif isnojudge(jni_methods, defin):
        #     add_data_tofile(file, "is_tainted:noJudge, ")
        #     add_data_tofile(file, "value:default, ")
        # elif isFirst(jni_methods, s):
        #     add_data_tofile(file, "is_tainted:true, ")
        #     add_data_tofile(file, "value:default, ")
        else:
            add_data_tofile(file, "is_tainted:false, ")
            add_data_tofile(file, "value:" + str(get_value(ptype, defin)) + ", ")
            dpd = s + "===>" + defin[-1]
        # print("346", str(get_value(ptype, defin)))
        add_data_tofile(file, "type:" + ptype)
        add_data_tofile(file, "}\n")
    return dpd


#
# def deal_param(jni_methods, index, s, defin, file, typelist):
#     dpd = ""
#     para = s.split(";")[-1][1:]
#     if int(para) > 0:
#         add_data_tofile(file, "p" + para + ":{")
#         ptype = typelist[0][int(para) - 1]
#         # 第一个参数
#         if isFirst(jni_methods,s) and index == 0:
#             add_data_tofile(file, "is_tainted:true, ")
#             add_data_tofile(file, "value:default, ")
#         # 第二个jni函数开始，就不判断为true了
#         elif not notaintpara(jni_methods, s, para):
#             add_data_tofile(file, "is_tainted:false, ")
#             add_data_tofile(file, "value:" + str(get_value(ptype, defin)) + ", ")
#             dpd = s + "===>" + defin[-1]
#         elif isnojudge(jni_methods, defin):
#             add_data_tofile(file, "is_tainted:noJudge, ")
#             add_data_tofile(file, "value:default, ")
#
#         # elif isFirst(jni_methods, s):
#         #     add_data_tofile(file, "is_tainted:true, ")
#         #     add_data_tofile(file, "value:default, ")
#         else:
#             add_data_tofile(file, "is_tainted:false, ")
#             add_data_tofile(file, "value:" + str(get_value(ptype, defin)) + ", ")
#             dpd = s + "===>" + defin[-1]
#         add_data_tofile(file, "type:" + ptype)
#         add_data_tofile(file, "}\n")
#     return dpd


# 对函数的每个参数进行依赖分析
def DFS(jni_method, graph, jni_fun, file, index):
    # add_data_tofile(file, "method:" + str(index + 1) + "\n{\n")
    # params = jni_fun.split("@signature")[1].split("`")[1]
    mtd_sig = jni_fun.split("@signature")[1].split("`")[1]
    params = jni_fun.split("param:")[1].strip()
    # print("391",mtd_sig)
    add_data_tofile(file, "method:" + mtd_sig + "\n{\n")
    # 创建参数类型
    typelist = convertType.create_types(mtd_sig)
    dpd = []
    # 深度遍历
    set1 = set()
    # each params
    for s in find_jni(graph, jni_fun):
        # print("\n\n 396", s)
        stack, data, dep = [s], [s], 0
        while stack and dep <= depth:
            dep = dep + 1
            n = stack.pop()
            if n in graph.keys():
                nodes = graph[n]
                # print("403", dep, n," ====> ", nodes)
                for i in nodes[::-1]:  # 栈先进后出
                    if i not in data:  # avoid loop
                        stack.append(i)
                        data.append(i)
            # else:
            #     break

        # print("410",data)
        # print("411",stack)
        # 对jni函数参数的多次调用进行分析
        pars = s.rstrip().rsplit(";", 1)[1]
        if pars not in set1:
            # jni_method：
            # index: the ith jni_method
            # s:the jni_method jawa(contain the taint path)
            # data: the IDDG's DFS
            # file :script_txt
            # typelist:params type
            dpd1 = deal_param(jni_method, index, s, data, file, typelist, params)
            if dpd1 != "":
                dpd.append(dpd1)
            set1.add(pars)
    add_data_tofile(file, "}\n")
    print("=========\n\n")
    return dpd


# 为每个apk创建目录
def create_script_folder(output, filename):
    script = os.path.join(output, "scripts")
    if not os.path.exists(script):
        os.mkdir(script)
    script_folder = os.path.join(script, filename)
    if not os.path.exists(script_folder):
        os.mkdir(script_folder)


# 为每条污点路径生成一个脚本文件
def create_script_file(output, filename, Num):
    folder = os.path.join(output, "scripts", filename)
    if os.path.exists(folder):
        file = os.path.join(folder, "script_" + str(Num) + ".txt")
        f = open(file, "w")
        f.close()
    else:
        logging.warning("can't find the script folder.")
    return file


# 添加信息到文件中
def add_tofile(file, data):
    with open(file, "a") as f:
        seq = "sequence:{"
        for i in data:
            fun = i.rstrip()
            seq = seq + fun + ","
        seq = seq[:-1] + "}\n"
        f.write(seq)
    f.close()


# 添加字符串
def add_data_tofile(file, data):
    with open(file, "a") as f:
        f.write(data)
    f.close()


# 获取省略信息
def getmethod(lines):
    if "@signature" in lines:
        line = lines.split("@signature")[1].split("`")[1]
        line1 = lines.split(";")[-1]
        return line + " " + line1
    return ""


# 分析函数的定义来给出依赖关系
def deal_dpd(methods):
    set_dep = set()
    mes = clone_list(methods)
    for method in methods:
        for i in method:
            for me in mes:
                for j in me:
                    para = i.split("===>")[0]
                    pta = i.split("===>")[1]
                    para1 = j.split("===>")[0]
                    pta1 = j.split("===>")[1]
                    if i != j and pta == pta1:
                        data = getmethod(para1) + "<===>" + getmethod(para)
                        if data not in set_dep:
                            set_dep.add(getmethod(para) + "<===>" + getmethod(para1))
    return set_dep


# 判断该函数是否为static
def judge_static(output, file, method):
    flag = 0
    report_file = os.path.join(output, "report", file + ".txt")
    with open(report_file, "r") as f:
        lines = f.readlines()
    f.close()
    lineNum = 0
    for line in lines:
        lineNum = lineNum + 1
        if lineNum == 5:
            lists = line.replace("native_method = ", "").split(",")
            for list in lists:
                if method.strip() == list[:-2].strip():
                    if list.strip()[-1] == "1":
                        flag = 1
    if flag == 1:
        return True
    else:
        return False


# source包括其他语句
def judge_nosource(line):
    param = line.split(" ===> ")[0]
    if ".onActivityResult:(IILandroid/content/Intent;)V" in param:
        return False
    if ".onNewIntent:(Landroid/content/Intent;)V" in param:
        return False
    if ".onHandleIntent:(Landroid/content/Intent;)V" in param:
        return False
    if ".findViewById:(I)Landroid/view/View;" in param:
        return False
    return True


def find_dgg(index, jni, taintpath_list):
    path_list = re.split(r",(?![^(]*\))", taintpath_list[index])
    sig = jni.split(" ")[0]
    par = "param: " + jni.split(" ")[1].rstrip()
    for n in path_list:
        if sig in n and par in n:
            return n


def get_taintpath(data_path, apk_name):
    taintpath_list = []
    appdata_file = os.path.join(data_path, apk_name, "result", "AppData.txt")
    if os.path.exists(appdata_file):
        with open(appdata_file, "r") as f:
            lines = f.readlines()
            num, flag = 0, 0
            for m in lines:
                if m.startswith("  Discovered taint paths are listed below:"):
                    flag = 1
                if flag == 1:
                    if num % 7 == 6:
                        taintpath_list.append(m.rstrip()[13:-1])
                    num = num + 1
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
            # get the taint graph.
            with open(abspath, "r") as f:
                lines = f.readlines()
                for i in lines:
                    if len(i.split(" ====> ")) == 2:
                        key = i.split(" ====> ")[1].rstrip()
                        value = i.split(" ====> ")[0].rstrip()
                        # 如果key为空，则新建列表，加入
                        if not graphs.__contains__(key):
                            graphs[key] = []
                        graphs[key].append(value)
            f.close()

            # display(graphs)

            taintpath_list = get_taintpath(self.Data_path, self.apkname)

            # 根据IDDG来生成对应的jni函数信息
            taint_path = os.path.join(self.Data_path, self.apkname, "result", "Taint.txt")
            # 创建文件script.txt文件
            utils.create_floder(self.Script_path)
            utils.create_floder(os.path.join(self.Script_path, self.apkname))

            if os.path.exists(taint_path):
                with open(taint_path, "r") as f:
                    taint_lines = f.readlines()
                    # 每一个文件生成一个待处理的文件
                    Num, unique_taint = 0, set()
                    for index, line in enumerate(taint_lines):
                        # 污点路径唯一
                        if line not in unique_taint:

                            # 如果污点不是我们所需要的，则不考虑
                            if judge_nosource(line):
                                Num = Num + 1
                                # 创建script文件
                                files = utils.create_script_file(self.Script_path, self.apkname, Num)
                                # print("=============634=================\n\n\n")
                                # print(files)
                                # print("==============636===================\n\n\n")

                                # 污点信息对称
                                taint_source = line.split(" ===> ")[0]
                                add_data_tofile(files, taint_source + "\n")

                                # 添加sequence
                                jni_methods = line.split(" ===> ")[1:]
                                # print("644",jni_methods)
                                add_tofile(files, jni_methods)
                                dpds = []

                                # 根据jni信息来获取对应的IDDG信息
                                for k, jni in enumerate(jni_methods):
                                    jni_fun = find_dgg(index, jni, taintpath_list)
                                    if jni_fun:
                                        # print("629",jni_methods, jni_fun, files, k)
                                        dpd = DFS(jni_methods, graphs, jni_fun, files, k)
                                        dpds.append(dpd)

                                add_data_tofile(files, "dependence{\n")
                                for i in deal_dpd(dpds):
                                    add_data_tofile(files, i)
                                add_data_tofile(files, "}")

                                unique_taint.add(line)
                            else:
                                print(" [*] no consider this source");
                        else:
                            print(" [*] not unique")
                f.close()
        else:
            print(" [!] Can't find the apk's IDDG.")

    # 优化：加上static以及对于多个jni函数进行分开
    def optimize(self):
        print(" [+] optimize the taint path.")
        scirpt_folder = self.Script_path
        if os.path.isdir(scirpt_folder):
            app_path = os.path.join(scirpt_folder, self.apkname)
            if os.path.exists(app_path):
                for script_lists in os.listdir(app_path):
                    script_file = os.path.join(app_path, script_lists)
                    with open(script_file, "r") as f:
                        lines = f.readlines()
                        with open(script_file, "w") as f1:
                            num = 0
                            list = []
                            for i in lines:
                                if i.startswith("method:"):
                                    num = 1
                                    if judge_static(self.out_path, self.apkname, i[7:]):
                                        data = i.rstrip() + " static\n"
                                    else:
                                        data = i.rstrip() + " nostatic\n"
                                    f1.write(data)
                                    list.append(data)
                                else:
                                    num = num + 1
                                    if num != 3 and i.startswith("p1:{"):
                                        f1.write("}\n" + list[-1] + "{\n")
                                    f1.write(i)
                        f1.close()
                    f.close()
        else:
            print(" [!] can't find the script floder.")


if __name__ == "__main__":
    # python Generate_txt.py apk/Native1.apk out
    # apk_path = "apk/Native1.apk"
    # out_paths = "out"
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    gener = Generate_txt(apk_path, out_paths)
    gener.getgraph()
    gener.optimize()
