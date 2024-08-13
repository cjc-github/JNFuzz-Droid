import os

from utils import assign_source
from utils import utils, java_dalvik_bridge
from utils.logging_config import setup_logging
from utils.generate_server_cpp import judge_static, makefile, switch_jni

log = setup_logging(name=__name__)

dimen_one = 5
dimen_two = 5
array_length = 5
btype_dict = {'boolean': 1,
              'byte': 1,
              'short': 2,
              'char': 2,
              'int': 4,
              'float': 4,
              'long': 8,
              'double': 8}
btype_dicts = {'boolean': "[Z",
               'byte': "[B",
               "short": "[S",
               "char": "[C",
               "int": "[I",
               "float": "[F",
               "long": "[J",
               "double": "[D"}


# release the local reference
def release_localref(data_list, data, num):
    data_list.append(data)
    data_list.append(", par" + str(num))
    data_list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
    return data_list, num + 1


def define1(method, i, st):
    method_list = java_dalvik_bridge.create_types(method)
    if st.rstrip() == "static":
        data = "typedef " + switch_jni(method_list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jclass class,"
    else:
        data = "typedef " + switch_jni(method_list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jobject obj,"
    num = 1
    for i in method_list[0]:
        data += switch_jni(i) + " i" + str(num) + ","
        num = num + 1
    data = data[:-1] + ");"
    return data


def cut_seed(out_path, file_path, java_method, size, apk_name):
    with open(file_path, "r") as f:
        lines = f.readlines()

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

    space = " " * 12
    data = space + "if(strlen(data) >= 0){\n"
    for be in para_before:
        data += space + be + "\n"
    data += space + para_info + ");\n"
    for af in para_after:
        data += space + af + "\n"
    data += space + "}\n"
    log.info(f"[+] the number of bytes to be generated: {totalsize}.")
    return totalsize, data


def gen_2demin(x=5, y=10, line="", num=0, totalsize=0):
    types = line.split("[][]")[0]
    if "type:" in types:
        types = types.split("type:")[1]

    data_list = []
    space = " " * 4
    data = f"jclass par{num} = (*env)->FindClass(env, \"{btype_dicts[types]}\");\n"
    data += f"{space * 3}jobjectArray par{num + 1} = (*env)->NewObjectArray(env, {x} ,par{num}, NULL);\n"
    data += f"{space * 3}j{types} par{num + 2}[{y}];\n"
    data += f"{space * 3}for(int i = 0; i < {x}; i++){{\n"
    data += f"{space * 4}j{types}Array par{num + 3} = (*env)->New{types.title()}Array(env, {y});\n"
    data += f"{space * 4}for(int j = 0; j < {y}; j++){{\n"
    data += f"{space * 5}par{num + 2}[j] = getjni_{types}(data, {btype_dict[types]} * (i * {y} + j + 1)+{totalsize});\n"
    data += f"{space * 4}}}\n"
    data += f"{space * 4}(*env)->Set{types.title()}ArrayRegion(env, par{num + 3}, 0, {y}, par{num + 2});\n"
    data += f"{space * 4}(*env)->SetObjectArrayElement(env, par{num + 1}, i, par{num + 3});\n"
    data += f"{space * 3}}}"

    data_list, num = release_localref(data_list, data, num + 1)
    num = num + 2
    totalsize = totalsize + x * y * btype_dict[types]
    return data_list, num, totalsize


def deal_basic_type(out_path, t, num, totalsize, size, apkname):
    # some custom type
    custom_type_dict = {
        "Context": "getGlobalContext(env);",
        "Intent": "getIntent(env,obj);",
        "Handler": "getGlobalContext(env);",
        "PendingIntent": "getPendingIntent(env,obj0);",
        "Bundle": "getBundle(env,obj0);",
        "Object": "getGlobalContext(env);",
    }

    data_list = []
    if t == "java.lang.String[]":
        space = " " * 12
        data = f"jclass par{num} = (*env)->FindClass(env,\"java/lang/String\");\n"
        data += f"{space}jobjectArray par{num + 1} = (*env)->NewObjectArray(env, {array_length}, par{num}, 0);\n"
        data += f"{space}for(int i=0;i<{array_length};i++){{\n"
        data += f"{space}char par{num + 2}[{size}];\n"
        data += f"{space}getjni_string(par{num + 2}, data, i*10+{totalsize}, {size});\n"
        data += f"{space}char * par{num + 3} = par{num + 2};\n"
        data += f"{space}jstring par{num + 4} = (*env)->NewStringUTF(env, par{num + 3});\n"
        data += f"{space}(*env)->SetObjectArrayElement(env, par{num + 1},i,par{num + 4});\n"
        data += f"{space}(*env)->DeleteLocalRef(env, par{num + 4});\n"
        data += f"{space}}}\n"

        data_list, num = release_localref(data_list, data, num + 1)
        num = num + 3
        totalsize = totalsize + array_length * int(size)
    elif t in btype_dict.keys():
        data = f"j{t} par{num} = getjni_{t}(data, {totalsize});"

        data_list.append(data)
        data_list.append(", par" + str(num))
        data_list.append("")
        totalsize = totalsize + btype_dict[t]
        num = num + 1
    elif t == "java.lang.String":
        space = " " * 12
        data = f"char par{num}[{size}];\n"
        data += f"{space}getjni_string(par{num}, data, {totalsize}, {size});\n"
        data += f"{space}char *par{num + 1} = par{num};\n"
        data += f"{space}jstring par{num + 2} = (*env)->NewStringUTF(env, par{num + 1});"

        data_list, num = release_localref(data_list, data, num + 2)
        totalsize = totalsize + int(size)
    elif "[][]" in t:
        log.warning("[*] The dimension of a two-dimensional array is uncertain.")
        data_list, num, totalsize = gen_2demin(dimen_one, dimen_two, t, num, totalsize)
    elif t in custom_type_dict:
        data0 = f"jobject par{num} = {custom_type_dict.get(t)}"
        data_list, num = release_localref(data_list, data0, num)
    else:
        flag = 0
        for m in btype_dict.keys():
            if m in t:
                flag = 1
                data = f"{m} par{num}[{array_length}] = {{"
                for k in range(array_length):
                    data += f"getjni_{m}(data,{totalsize}), "
                    totalsize += btype_dict[m]
                data = data[:-2] + "};\n"

                space = " " * 12
                data += f"{space}{switch_jni(m)}Array par{num + 1} = (*env)->New{m.title()}Array(env, {array_length});\n"
                data += f"{space}(*env)->Set{m.title()}ArrayRegion(env, par{num + 1}, 0, {array_length}, par{num});\n"
                data_list, num = release_localref(data_list, data, num + 1)
        if flag == 0:
            utils.save_file(out_path, " [+]" + apkname + " have the complex type.")
    return data_list, num, totalsize


def analysis_line(out_path, line, num, size, totalsize, taint_path, apkname):
    data_list = []
    if line.split(":{is_tainted:")[1].split(",")[0] == "true":
        data_list, num = assign_source.assign_source_x86(out_path, line, num, data_list, taint_path, apkname)
    elif not line.split(", ")[1].split(":")[1] == "default":
        if "[][]" in line.split("type:")[1] and "[][][]" not in line.split("type:")[1]:
            log.info("[+] Determines the dimensions of a two-dimensional array.")
            x, y = line.split("[")[1].split("]")[0].split(", ")
            data_list, num, totalsize = gen_2demin(int(x), int(y), line, num, totalsize)
        elif "[]" in line.split("type:")[1]:
            types = line.split("type:")[1].split("[]")[0]
            para_lists = line.split("value:")[1].split(", type")[0]
            nums = len(para_lists.split(","))

            space = " " * 12
            data = f"{switch_jni(types)} par{num}[{nums}] = {{"
            for para_list in para_lists[1:-1].split(", "):
                if switch_jni(types) == "jchar":
                    data += f"'{para_list}',"
                else:
                    data += f"{para_list},"
            data = data[:-1] + "};\n"

            data += f"{space}{switch_jni(types)}Array par{num + 1} = (*env)->New{types.title()}Array(env, {nums});\n"
            data += f"{space}(*env)->Set{types.title()}ArrayRegion(env, par{num + 1}, 0, {nums}, par{num});\n"

            data_list, num = release_localref(data_list, data, num + 1)
            num = num + 2
        elif line.split("type:")[1].rstrip() == "java.lang.String}":
            data = line.split(", ")[1].split(":")[1]
            data0 = f"jstring par{num} = (*env)->NewStringUTF(env, \"{data}\");"

            data_list, num = release_localref(data_list, data0, num)
            num = num + 1
        elif line.split("type:")[1].rstrip() == "boolean}":
            if line.split(", ")[1].split("value:")[1] == "false":
                data = 0
            else:
                data = 1
            data_list.append(", " + str(data))
        elif line.split("type:")[1].rstrip() == "char}":
            data = ", \'" + line.split(", ")[1].split("value:")[1] + "\'"
            data_list.append(data)
        else:
            data = ", " + line.split(", ")[1].split("value:")[1]
            data_list.append(data)
    else:
        types = line.split(", type:")[1][:-2]
        data_list, num, totalsize = deal_basic_type(out_path, types, num, totalsize, size, apkname)
    return data_list, num, totalsize


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
            print("217", data)
        elif "targetLibName = \"/data/local/tmp/libleak.so\";" in line:
            data += f"{space}jstring targetLibName = \"/data/local/tmp/{so_file}.so\";\n"
        elif "className = \"org/arguslab/native_leak/MainActivity\";" in line:
            class_name = java_method.split(";")[0][1:]
            data += f"{space}jstring className = \"{class_name}\";\n"
        elif "targetFunctionName = \"Java_org_arguslab_native_1leak_MainActivity_send\";" in line:
            data += f"{space}jstring targetFunctionName = \"{target_native_name}\";\n"
        elif "printf(\"Received message: %s\\n\", buf);" in line:
            data += line
            data += f"{space * 3}char* data=buf;\n"
            totalsize, add_data = cut_seed(out_path, file_path, java_method, size, apk_name)
            data += add_data
        else:
            data += line
    f.write(data)
    f.close()
    return totalsize
