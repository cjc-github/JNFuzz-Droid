import logging
import os.path
import stat

import xml.dom
import xml.dom.minidom
from utils.convertType import create_types, get_type


# add the .apk suffix to non-apk endings
def deal_apk(apk_name):
    if not apk_name.endswith(".apk"):
        os.rename(apk_name, apk_name + ".apk")
        return apk_name + ".apk"
    return apk_name


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

def get_apkname(apk_path):
    return apk_path[:-4].rsplit("/", 1)[1]


# create new folder
def create_floder(folder):
    if not os.path.exists(folder):
        os.mkdir(folder)


# create a script file
def create_script_file(folder, filename, Num):
    folder = os.path.join(folder, filename)
    if os.path.exists(folder):
        file = os.path.join(folder, "script_" + str(Num) + ".txt")
        f = open(file, "w")
        f.close()
    else:
        logging.warning(" [+] can't find the script folder.")
    return file


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
    f.close()


# save tmp_lists to taint_txt
def write_tofile(tmp_lists, taint_txt):
    with open(taint_txt, "w") as f:
        for i in tmp_lists:
            for j in i:
                f.write(j)
    f.close()


# save to reports.txt中
def save_file(output, line):
    file_name = os.path.join(output, "report.txt")
    with open(file_name, "a") as f:
        f.write(line + "\n")
    f.close()


def save_static_time(output, line):
    filename = os.path.join(output, "static_exec_time.txt")
    with open(filename, "a") as f:
        f.write(line + "\n")
    f.close()


# Amandroid->FlowDroid
# for example
# Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V
# <org.arguslab.native_leak.MainActivity: void send(java.lang.String)>
def changeAmdtoFlow(amandroid_method):
    cls = amandroid_method[1:].split(";.")[0]
    met = amandroid_method.split(";.")[1].split(":")[0]
    typelist = create_types(amandroid_method)
    paras = ",".join(typelist[0])
    ans = "<" + cls.replace("/", ".") + ": " + typelist[1] + " " + met + "(" + paras + ")>"
    return ans


# FlowDroid->Amandroid
def changeFlowtoAmd(Flowdroid_method):
    cls = Flowdroid_method[1:].split(":")[0]
    met = Flowdroid_method.split(" ")[2].split("(")[0]
    ret = Flowdroid_method.split(" ")[1]
    pars = Flowdroid_method.split("(")[1].split(")")[0]
    ret1, pars1 = get_type(ret, pars)
    ans = "L" + cls.replace(".", "/") + ";." + met + ":(" + pars1 + ")" + ret1
    return ans


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


# Check whether the file is an elf file
def is_ELFfile(filepath):
    if not os.path.exists(filepath):
        print(' [*] file path {} doesnot exits'.format(filepath))
        return False
    try:
        FileStates = os.stat(filepath)
        FileMode = FileStates[stat.ST_MODE]
        if not stat.S_ISREG(FileMode) or stat.S_ISLNK(FileMode):
            return False
        with open(filepath, 'rb') as f:
            header = (bytearray(f.read(4))[1:4]).decode(encoding="utf-8")
            if header in ["ELF"]:
                return True
    except UnicodeDecodeError as e:
        pass

    return False


# return so file
def get_so_files(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    if not os.path.exists(os.path.join(decompile_path, "lib")):
        return ""
    else:
        parent_abi = os.path.join(decompile_path, "lib")
        so_files = ""
        for abi in os.listdir(parent_abi):
            abi_paths = os.path.join(parent_abi, abi)
            if os.path.isdir(abi_paths):
                for abi_path in os.listdir(abi_paths):
                    so_path = os.path.join(abi_paths, abi_path)
                    if so_path.endswith(".so"):
                        so_files += so_path + ","
        return so_files[:-1]


# get native-activity
def get_native_activity(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    if not os.path.exists(os.path.join(decompile_path, "AndroidManifest.xml")):
        print(" [*]" + name + " is not exist.")
        return ""
    else:
        tags = ""
        Manifest = os.path.join(decompile_path, "AndroidManifest.xml")
        DOMTree = xml.dom.minidom.parse(Manifest)
        collection = DOMTree.documentElement
        Results = collection.getElementsByTagName("activity")
        for result in Results:
            if result.getAttribute("android.app.NativeActivity"):
                tags = tags + result.getAttribute("android:name") + ","
                metas = result.getElementsByTagName("meta-data")
                for meta in metas:
                    if meta:
                        tags = tags + result.getAttribute("android:name") + ","
        return tags[:-1]


# obtain the native method name via analyzing decompiled smail code
# find the static and dynamic registration
def get_native_methods(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    results = ""
    for file_name in os.listdir(decompile_path):
        smali_path = os.path.join(decompile_path, file_name)
        if file_name.startswith("smali") and os.path.isdir(smali_path):
            result = smali_folder(smali_path)
            for re in result:
                results = results + re.strip() + ","
    return results[:-1]


# add some third-library smail code file that do not analysis
def judgethird(file):
    if file.split("/")[4] == "android":
        return False
    if file.split("/")[4] == "androidx":
        return False
    if file.split("/")[4] == "com" and file.split("/")[5] == "google":
        return False
    return True


# deal smail code file, and return normative native method.
def smali_folder(file_name):
    num = len(file_name.split("/"))
    results = set()
    for file in list_all_files(file_name):
        file = file.replace("//", "/")
        # judge some third library file
        if judgethird(file):
            with open(file, "r") as f:
                lines = f.readlines()
                for line in lines:
                    if line.startswith(".method ") > 0 and line.find(" native ") > 0:
                        method = "L" + file.split("/", num)[-1][:-6] + ";." + line.split(" ")[-1].replace("(", ":(")
                        if line.find(" static ") > 0:
                            method = method.strip() + " 1"
                        else:
                            method = method.strip() + " 0"
                        results.add(method)
    return results


# display text file
def displaytxt(file_name):
    if os.path.exists(file_name):
        with open(file_name, "r") as f:
            lines = f.readlines()
        f.close()
        print("filename context:")
        for i in lines:
            print(i)
