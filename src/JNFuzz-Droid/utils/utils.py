import os
import stat
import logging

from utils.convertType import create_types, get_type
from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


# add the .apk suffix to non-apk endings
def deal_apk(apk_name):
    if not apk_name.endswith(".apk"):
        os.rename(apk_name, apk_name + ".apk")
        return apk_name + ".apk"
    return apk_name


def get_apkname(apk_path):
    return apk_path[:-4].rsplit("/", 1)[1]


# create new folder
def create_floder(folder):
    if not os.path.exists(folder):
        os.mkdir(folder)


# create a script file
def create_script_file(folder, filename):
    num, flag = 1, False
    folder = os.path.join(folder, filename)
    if os.path.exists(folder):
        while not flag:
            file = os.path.join(folder, "script_" + str(num) + ".txt")
            if not os.path.exists(file):
                f = open(file, "w")
                f.close()
                flag = True
                return file
            else:
                num = num + 1
    else:
        logging.error("[*] can't create the script file.")


# remove dir
def remove_dir(folder):
    if os.path.isdir(folder):
        for p in os.listdir(folder):
            remove_dir(os.path.join(folder, p))
        if os.path.exists(folder):
            os.rmdir(folder)
    else:
        if os.path.exists(folder):
            os.remove(folder)


def judge_input(path):
    if os.path.exists(path):
        return True
    else:
        return False


# save tmp_list to taint_txt
def write_to_file(tmp_list, taint_txt):
    with open(taint_txt, "w") as f:
        for i in tmp_list:
            f.write(i.rstrip())
            f.write("\n")


# save tmp_lists to taint_txt
def write_tofile(tmp_lists, taint_txt):
    with open(taint_txt, "w") as f:
        for i in tmp_lists:
            for j in i:
                f.write(j)


# save to reports.txt中
def save_file(output, line):
    file_name = os.path.join(output, "report.txt")
    with open(file_name, "a") as f:
        f.write(line + "\n")


def save_static_time(output, line):
    filename = os.path.join(output, "static_exec_time.txt")
    with open(filename, "a") as f:
        f.write(line + "\n")


# Amandroid's dalvik type to FlowDroid's java type
# for example
# Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V
# <org.arguslab.native_leak.MainActivity: void send(java.lang.String)>
def dalvik2java_type(dalvik_method):
    cls = dalvik_method[1:].split(";.")[0]
    met = dalvik_method.split(";.")[1].split(":")[0]
    type_list = create_types(dalvik_method)
    paras = ",".join(type_list[0])
    java_method = "<" + cls.replace("/", ".") + ": " + type_list[1] + " " + met + "(" + paras + ")>"
    return java_method


# FlowDroid's java type to Amandroid's dalvik type
# for example
# <org.arguslab.native_leak.MainActivity: void send(java.lang.String)>
# Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V
def java2dalvik_type(java_method):
    cls = java_method[1:].split(":")[0]
    met = java_method.split(" ")[2].split("(")[0]
    ret = java_method.split(" ")[1]
    pars = java_method.split("(")[1].split(")")[0]
    ret1, pars1 = get_type(ret, pars)
    dalvik_method = "L" + cls.replace(".", "/") + ";." + met + ":(" + pars1 + ")" + ret1
    return dalvik_method


def get_type_index(sink):
    Flowdroid_sink = "<" + sink.split("<")[1].split(">")[0] + ">"
    jparas = sink.split(">(")[1].split(")")[0]
    par_list = []
    pars = Flowdroid_sink.split("(")[1].split(")")[0]
    if pars == "":
        return par_list
    elif "," not in pars:
        tmp = [1, pars, jparas]
        par_list.append(tmp)
        return par_list
    else:
        jps = jparas.split(", ")
        for k, v in enumerate(pars.split(",")):
            tmp = [k + 1, v, jps[k]]
            par_list.append(tmp)
        return par_list


'''
Here's some static analysis for Android
'''


# list all files
def list_all_files(file_name):
    _files = []
    list_file = os.listdir(file_name)
    for i in range(0, len(list_file)):
        path = os.path.join(file_name, list_file[i])
        if os.path.isdir(path):
            _files.extend(list_all_files(path))
        if os.path.isfile(path):
            _files.append(path)
    return _files


# display text file
def displaytxt(file_name):
    if os.path.exists(file_name):
        with open(file_name, "r") as f:
            lines = f.readlines()
        print("filename context:")
        for i in lines:
            print(i)
