import os

from utils import convertType, utils
from utils import AddSource

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)

dimen_one = 5
dimen_two = 5
array_length = 5
btype_dict = {'boolean': 1, 'byte': 1, 'short': 2, 'char': 2, 'int': 4, 'float': 4, 'long': 8, 'double': 8}
btype_dicts = {'boolean': "[Z", 'byte': "[B", "short": "[S", "char": "[C", "int": "[I", "float": "[F", "long": "[J",
               "double": "[D"}


def define(method, i, st):
    list = convertType.create_types(method)
    if st.rstrip() == "static":
        data = "typedef " + switch_jni(list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jclass class,"
    else:
        data = "typedef " + switch_jni(list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jobject obj,"
    num = 1
    for i in list[0]:
        data = data + switch_jni(i) + " i" + str(num) + ","
        num = num + 1
    data = data[:-1] + ");"
    return data


def write_c(f, data, lens):
    str = ""
    for i in range(lens):
        str = str + "    "
    str = str + data + "\n"
    f.write(str)


def judge_static(file_path, method):
    with open(file_path, "r") as f:
        lines = f.readlines()
    f.close()
    for line in lines:
        if "method:" + method in line:
            data = line.split(" ")[1]
            if data.strip() == "static":
                return True
            else:
                return False
    return False


def switch_jni(para):
    dict1 = {"void": "void",
             "int": "jint",
             "boolean": "jboolean",
             "byte": "jbyte",
             "short": "jshort",
             "char": "jchar",
             "long": "jlong",
             "float": "jfloat",
             "double": "jdouble",
             "int[]": "jintArray",
             "boolean[]": "jbooleanArray",
             "byte[]": "jbyteArray",
             "short[]": "jshortArray",
             "char[]": "jcharArray",
             "long[]": "jlongArray",
             "float[]": "jfloatArray",
             "double[]": "jdoubleArray",
             "java.lang.String": "jstring",
             "java.lang.String[]": "jobjectArray"}
    if dict1.__contains__(para):
        return dict1.get(para)
    else:
        return "jobjectArray"


def judge_before(lists, info, i, n):
    data = info[n]
    num = 0
    for list in lists:
        if list[n] == data:
            if i == num:
                return -1
            else:
                return num
        num = num + 1


def makefile(out_path, name):
    out = os.path.join(out_path, "outcome")
    if not os.path.exists(out):
        os.mkdir(out)
    out1 = os.path.join(out, name)
    if not os.path.exists(out1):
        os.mkdir(out1)


def deal_return(list):
    para_return = list[1].split(" ")[1]
    if para_return == "void":
        return ""
    else:
        return para_return


def deal_info(list):
    jni_method = list[1].split("*")[1].split("_")[0]
    jni_info = jni_method + "(env,"
    if list[1].split("*env,")[1].split(" ")[0] == "jobject":
        jni_info = jni_info + "obj" + str(list[2])
    else:
        jni_info = jni_info + "class" + str(list[2])
    return jni_info


def gen_2demin(x=5, y=10, line="", num=0, totalsize=0):
    types = line.split("[][]")[0]
    if "type:" in types:
        types = types.split("type:")[1]
    list = []
    space = " " * 12
    data = "jclass par" + str(num) + " = (*env)->FindClass(env, \"" + btype_dicts[types] + "\");\n"
    data = data + space + "jobjectArray par" + str(num + 1) + " = (*env)->NewObjectArray(env, " + str(
        x) + " ,par" + str(num) + ",NULL);\n"
    data = data + space + "j" + types + " par" + str(num + 2) + "[" + str(y) + "];\n"
    data = data + space + "for(int i=0;i<" + str(x) + ";i++){\n"
    data = data + space + "    j" + types + "Array par" + str(
        num + 3) + " = (*env)->New" + types.title() + "Array(env," + str(y) + ");\n"
    data = data + space + "    for(int j=0;j<" + str(y) + ";j++){\n"
    data = data + space + "        par" + str(num + 2) + "[j] = getjni_" + types + "(data, " + str(btype_dict[
                                                                                                       types]) + "*(i*" + str(
        y) + "+j+1)+" + str(totalsize) + ");\n"
    data = data + space + "    }\n"
    data = data + space + "    (*env)->Set" + types.title() + "ArrayRegion(env,par" + str(num + 3) + ",0," + str(
        y) + ",par" + str(num + 2) + ");\n"
    data = data + space + "    (*env)->SetObjectArrayElement(env, par" + str(num + 1) + ", i, par" + str(
        num + 3) + ");\n"
    data = data + space + "}"
    list.append(data)
    list.append(",par" + str(num + 1))
    list.append("(*env)->DeleteLocalRef(env,par" + str(num + 1) + ");")
    totalsize = totalsize + x * y * btype_dict[types]
    num = num + 3
    return list, num, totalsize


def deal_basic_type(out_path, t, num, totalsize, size, apkname):
    list = []

    if t == "java.lang.String[]":
        space = " " * 12
        data = "jclass par" + str(num) + " = (*env)->FindClass(env,\"java/lang/String\");\n"
        data = data + space + "jobjectArray par" + str(num + 1) + " = (*env)->NewObjectArray(env, " + str(
            array_length) + ", par" + \
               str(num) + ", 0);\n"
        data = data + space + "for(int i=0;i<" + str(array_length) + ";i++){\n"
        data = data + space + "char par" + str(num + 2) + "[" + size + "];\n"
        data = data + space + "getjni_string(par" + str(num + 2) + ", data, i*10+" + str(
            totalsize) + ", " + size + ");\n"
        data = data + space + "char * par" + str(num + 3) + " = par" + str(num + 2) + ";\n"
        data = data + space + "jstring par" + str(num + 4) + " = (*env)->NewStringUTF(env, par" + str(num + 3) + ");\n"
        data = data + space + "(*env)->SetObjectArrayElement(env, par" + str(num + 1) + ",i,par" + str(num + 4) + ");\n"
        data = data + space + "(*env)->DeleteLocalRef(env, par" + str(num + 4) + ");\n"
        data = data + space + "}\n"
        list.append(data)
        list.append(", par" + str(num + 1))
        list.append("(*env)->DeleteLocalRef(env,par" + str(num + 1) + ");")
        totalsize = totalsize + array_length * int(size)
        num = num + 4
    elif t in btype_dict.keys():
        list.append("j" + t + " par" + str(num) + " = getjni_" + t + "(data," + str(totalsize) + ");")
        list.append(", par" + str(num))
        list.append("")
        totalsize = totalsize + btype_dict[t]
        num = num + 1
    elif t == "java.lang.String":
        data = "char par" + str(num) + "[" + size + "];\n"
        space = "            "
        data = data + space + "getjni_string(par" + str(num) + ",data," + str(totalsize) + "," + str(size) + ");\n"
        data = data + space + "char *par" + str(num + 1) + " = par" + str(num) + ";\n"
        data = data + space + "jstring par" + str(num + 2) + " = (*env)->NewStringUTF(env,par" + str(num + 1) + ");"
        list.append(data)
        list.append(", par" + str(num + 2))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num + 2) + ");")
        totalsize = totalsize + int(size)
        num = num + 3
    elif "[][]" in t:
        print("不确定二维数组的维度.")
        list, num, totalsize = gen_2demin(dimen_one, dimen_two, t, num, totalsize)
    elif t == "Context":
        data0 = "jobject par" + str(num) + " = getGlobalContext(env);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif t == "Intent":
        data0 = "jobject par" + str(num) + " = getIntent(env,obj);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif t == "Handler":
        data0 = "jobject par" + str(num) + " = getGlobalContext(env);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif t == "PendingIntent":
        data0 = "jobject par" + str(num) + " = getPendingIntent(env,obj0);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif t == "Bundle":
        data0 = "jobject par" + str(num) + " = getBundle(env,obj0);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif t == "Object":
        data0 = "jobject par" + str(num) + " = getGlobalContext(env);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    else:
        flag = 0
        for m in btype_dict.keys():
            if m in t:
                flag = 1
                data = "j" + m + " par" + str(num) + "[" + str(array_length) + "] = {"
                for k in range(array_length):
                    data = data + "getjni_" + m + "(data," + str(totalsize) + "), "
                    totalsize = totalsize + btype_dict[m]
                data = data[:-2] + "};\n"
                space = "            "
                data = data + space + switch_jni(m) + "Array par" + str(
                    num + 1) + " = (*env)->New" + m.title() + "Array(env, " + str(array_length) + ");\n"
                data = data + space + "(*env)->Set" + m.title() + "ArrayRegion(env, par" + str(
                    num + 1) + ", 0, " + str(
                    array_length) + ", par" + str(num) + ");\n"
                list.append(data)
                list.append(", par" + str(num + 1))
                list.append("(*env)->DeleteLocalRef(env, par" + str(num + 1) + ");")
                num = num + 2
        if flag == 0:
            utils.save_file(out_path, " [+]" + apkname + " have the complex type.")
    return list, num, totalsize


def analysis_line(out_path, line, num, size, totalsize, taintpath, apkname):
    list = []
    if line.split(":{is_tainted:")[1].split(",")[0] == "true":
        list, num = AddSource.addSource_x86(out_path, line, num, list, taintpath, apkname)
    elif not line.split(", ")[1].split(":")[1] == "default":
        if "[][]" in line.split("type:")[1] and "[][][]" not in line.split("type:")[1]:
            print("确定二维数组的维度.")
            x, y = line.split("[")[1].split("]")[0].split(", ")
            list, num, totalsize = gen_2demin(int(x), int(y), line, num, totalsize)
        elif "[]" in line.split("type:")[1]:
            types = line.split("type:")[1].split("[]")[0]
            para_lists = line.split("value:")[1].split(", type")[0]
            nums = len(para_lists.split(","))
            space = "            "
            data = switch_jni(types) + " par" + str(num) + "[" + str(nums) + "] = {"
            for para_list in para_lists[1:-1].split(", "):
                if switch_jni(types) == "jchar":
                    data = data + "'" + para_list + "'" + ","
                else:
                    data = data + para_list + ","
            data = data[:-1] + "};\n"
            data = data + space + switch_jni(types) + "Array par" + str(
                num + 1) + " = (*env)->New" + types.title() + "Array(env, " + str(nums) + ");\n"
            data = data + space + "(*env)->Set" + types.title() + "ArrayRegion(env, par" + str(num + 1) + ", 0, " + str(
                nums) + ", par" + str(num) + ");\n"
            list.append(data)
            list.append(", par" + str(num + 1))
            list.append("(*env)->DeleteLocalRef(env, par" + str(num + 1) + ");")
            num = num + 2
        elif line.split("type:")[1].rstrip() == "java.lang.String}":
            data = line.split(", ")[1].split(":")[1]
            data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + data + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
            num = num + 1
        elif line.split("type:")[1].rstrip() == "boolean}":
            if line.split(", ")[1].split("value:")[1] == "false":
                data = 0
            else:
                data = 1
            list.append(", " + str(data))
        elif line.split("type:")[1].rstrip() == "char}":
            data = ", \'" + line.split(", ")[1].split("value:")[1] + "\'"
            list.append(data)
        else:
            data = ", " + line.split(", ")[1].split("value:")[1]
            list.append(data)
    else:
        types = line.split(", type:")[1][:-2]
        list, num, totalsize = deal_basic_type(out_path, types, num, totalsize, size, apkname)
    return list, num, totalsize


def cut_seed(out_path, file_path, java_method, size, apk_name):
    f1 = open(file_path, "r")
    lines = f1.readlines()
    f1.close()

    para_num, totalsize = 0, 0
    para_before, para_data, para_after = [], [], []

    if judge_static(file_path, java_method):
        para_info = "targetFunctionPtr(env, CallerCls"
    else:
        para_info = "targetFunctionPtr(env, CallerObj"

    for line in lines:
        if line.startswith("p"):
            cans, para_num, totalsize = analysis_line(out_path, line, para_num, size, totalsize, lines[0], apk_name)
            if len(cans) == 3:
                para_before.append(cans[0])
                para_info += cans[1]
                para_after.append(cans[2])
            elif len(cans) == 1:
                para_info += cans[0]

    space = " " * 4
    data = space * 3 + "if(strlen(data) >= 0){\n"
    for be in para_before:
        data += space * 3 + be + "\n"
    data += space * 3 + para_info + ");\n"
    for af in para_after:
        data += space * 3 + af + "\n"
    data += space * 3 + "}\n"
    log.info(f"[+] the number of bytes to be generated: {totalsize}.")
    return totalsize, data


def generate_server_x86(out_path, apk_name, java_method, target_native_name, so_file, file_path, size):
    makefile(out_path, apk_name)
    pt = file_path.split("_")[-1][:-4]

    with open("./lib/examples/template_x86.cpp", "r") as f:
        lines = f.readlines()

    data, space = "", " " * 4
    server_path = os.path.join(out_path, "outcome", apk_name, f"server{pt}.c")
    f = open(server_path, "w", encoding='utf-8')
    for line in lines:
        if "typedef void function_t(JNIEnv *, jclass, jstring);" in line:
            if judge_static(file_path, java_method):
                data += space + define(java_method, "static") + "\n"
            else:
                data += space + define(java_method, "nostatic") + "\n"
        elif "targetLibName = \"/data/local/tmp/libleak.so\";" in line:
            data += space + "jstring targetLibName = \"/data/local/tmp/" + so_file + ".so" + "\";\n"
        elif "className = \"org/arguslab/native_leak/MainActivity\";" in line:
            data += space + "jstring className = \"" + java_method.split(";")[0][1:] + "\";\n"
        elif "targetFunctionName = \"Java_org_arguslab_native_1leak_MainActivity_send\";" in line:
            if target_native_name == "unreachable":
                data += space + "jstring targetFunctionName = \"" + java_method.split(":")[0].split(".")[1] + "\";\n"
            else:
                data += space + "jstring targetFunctionName = \"" + target_native_name + "\";\n"
        elif "printf(\"Received message: %s\\n\", buf);" in line:
            data += line
            data += space * 3 + "char* data=buf;\n"
            totalsize, add_data = cut_seed(out_path, file_path, java_method, size, apk_name)
            data += add_data
        else:
            data += line
    f.write(data)
    f.close()
    return totalsize
