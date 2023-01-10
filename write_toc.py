import sys
import os

from utils import convertType, dynamic_methods, utils
from utils import AddSource
# 头
from utils.exception import ToolsException

c1 = """\
#include "spsc.h"
#include "vm.h"
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define BUFFER_SIZE 1024 * 1024 *128

JavaVM *vm = NULL;
JNIEnv *env = NULL;

jint getjni_int(char * data, int x)
{
    jint i = 0;
    i += ((data[x] & 0xff) << 24);
    i += ((data[x+1] & 0xff) << 16);
    i += ((data[x+2] & 0xff) << 8);
    i += ((data[x+3] & 0xff));
    if (data[x]<0)
    {
        return i-4294967296;
    }else{
        return i;
    }
}

jlong getjni_long(char * data, int x)
{
    jlong i = 0;
    i += ((data[x] & 0xff) << 56);
    i += ((data[x+1] & 0xff) << 48);
    i += ((data[x+2] & 0xff) << 40);
    i += ((data[x+3] & 0xff) << 32);
    i += ((data[x+4] & 0xff) << 24);
    i += ((data[x+5] & 0xff) << 16);
    i += ((data[x+6] & 0xff) << 8);
    i += ((data[x+7] & 0xff));
    if (data[x]<0)
    {
        return i-9223372036854775808*2;
    }else{
        return i;
    }
}


jbyte getjni_byte(char * data, int x)
{
    return data[x];
}

jboolean getjni_boolean(char *data, int x)
{
    int i=data[x];
    if(i>0)
    {
        return true;
    }else{
        return false;
    }
}

jchar getjni_char(char *data, int x)
{
    jchar i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    return i;
}

jshort getjni_short(char *data, int x)
{
    jshort i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    if(data[x]<0)
    {
        return i-65536;
    }else{
        return i;
    }
}

union charFloat{
    char str[8];
    float value;
};

union charDouble{
    char str[8];
    double value;
};

jfloat getjni_float(char *data, int x)
{
    union charFloat f;
    f.str[3]=data[x];
    f.str[2]=data[x+1];
    f.str[1]=data[x+2];
    f.str[0]=data[x+3];
    return f.value;
}

jdouble getjni_double(char *data, int x)
{
    union charDouble dou;
    dou.value=0.0;
    dou.str[7]=data[x];
    dou.str[6]=data[x+1];
    dou.str[5]=data[x+2];
    dou.str[4]=data[x+3];
    dou.str[3]=data[x+4];
    dou.str[2]=data[x+5];
    dou.str[1]=data[x+6];
    dou.str[0]=data[x+7];
    return dou.value;
}

jobject getGlobalContext(JNIEnv *env) {
    jobject application = NULL;
    jclass activity_thread_clz = (*env)->FindClass(env,"android/app/ActivityThread");
    if (activity_thread_clz != NULL) {
        jmethodID currentApplication = (*env)->GetStaticMethodID(env,activity_thread_clz, "currentApplication", "()Landroid/app/Application;");
        if (currentApplication != NULL) {
            application = (*env)->CallStaticObjectMethod(env,activity_thread_clz, currentApplication);
        } else {
            printf("Cannot find method: currentApplication() in ActivityThread.");
        }
        (*env)->DeleteLocalRef(env,activity_thread_clz);
    } else {
        printf("Cannot find class: android.app.ActivityThread");
    }
    return application;
}

jobject getIntent(JNIEnv *env){
    jobject jobj = NULL;
    jclass intentclass = (*env)->FindClass(env, "android/content/Intent");
    if(intentclass == NULL)
    {
        return NULL;
    }
    jmethodID jid=(*env)->GetMethodID(env, intentclass, "<init>", "()V");
    
    jobj = (*env)->NewObject(env, intentclass, jid);
    return jobj;
}

jobjectArray getStringArray(JNIEnv *env,char* data)
{
    jclass cls = (*env)->FindClass(env, "java/lang/String");
    jobjectArray str_array = (*env)->NewObjectArray(env, 10, cls, 0);
    jstring jstr;
    for(int i=0; i<10; i++){
        jstr = (*env)->NewStringUTF(env, data);
        (*env)->SetObjectArrayElement(env, str_array, i, jstr);
        (*env)->DeleteLocalRef(env, jstr);
    }
    return str_array;
}

jobject getBundle(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = (*env)->FindClass(env, "android/os/Bundle");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = (*env)->GetMethodID(env, bundle, "<init>", "()V");
    
    jobj = (*env)->NewObject(env,bundle,jid);
    return jobj;
}

jobject getObject(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = (*env)->FindClass(env, "android/lang/Object");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = (*env)->GetMethodID(env, bundle, "<init>", "()V");
    
    jobj = (*env)->NewObject(env,bundle,jid);
    return jobj;
}

jobject getPendingIntent(JNIEnv *env, jobject obj){
    jobject jobj = NULL;
    jclass pcls =(*env)->FindClass(env, "android/app/PendingIntent");
    if (pcls!=NULL){
        return jobj;
    }
    jclass jcls=(*env)->FindClass(env,"android.app.PendingIntent");
    if(jcls==NULL){
        return NULL;
    }
    jmethodID getbroad=(*env)->GetMethodID(env, jcls,"getBroadcast","(Landroid/content/Context;ILandroid/content/Intent;I)Landroid.app.PendingIntent;");
    
    jobject context=getGlobalContext(env);
    jobject intent=getIntent(env);
    
    jobj=(*env)->CallObjectMethod(env,obj, getbroad, context,0,intent,0);
    return jobj;
}

void getjni_string(char *dest, char *src, int start, int n)
{
    char *p=dest;
    char *q=src;
    char *temp=NULL;
    int len=strlen(src);

    if(start>=len || start<0){
      return;
    }
    temp=q+start;
    if(n>strlen(temp)){
       n=strlen(temp);
    }
    q+=start;
    while(n--) *(p++)=*(q++);
    *(p++)='\\0';
}

int main(int argc, char** argv)
{
    printf(" [+] Native Harness\\n");
    
"""

c1_1 = """\
    int status = init_jvm(&vm, &env);
    if (status == 0) {
        printf(" [+] Initialization success (vm=%p, env=%p)\\n", vm, env);
    } else {
        printf(" [!] Initialization failure (%i)\\n", status);
        return 1;
    }
"""

# 中间
c2 = """\
    spsc_ring ring;
    if (spsc_create_sub(&ring, BUFFER_SIZE) == -1) return 1;

    printf("Fuzz testing ...\\n");
    char buf[512];
    while (1)
    {

        size_t n_read = spsc_read(&ring, buf, 511);
        if (n_read > 0)
        {
            buf[n_read] = '\\0';
            printf("Received message: %s\\n", buf);
            char* data=buf;
"""

# 结尾
c3 = """
        }
    }

    //关闭vm
    printf(" [+] Cleaning up VM\\n");
    (*vm)->DestroyJavaVM(vm);

    printf(" [+] Closing target library\\n");
    dlclose(handle0);

    return 0;
}
"""

# 定义一些参数
dimen_one = 5
dimen_two = 5
array_length = 5
btype_dict = {'boolean': 1, 'byte': 1, 'short': 2, 'char': 2, 'int': 4, 'float': 4, 'long': 8, 'double': 8}
btype_dicts = {'boolean': "[Z", 'byte': "[B", "short": "[S", "char": "[C", "int": "[I", "float": "[F", "long": "[J",
               "double": "[D"}


# 判断jni函数是否为static
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


# 获取类名
def getClass(method):
    jni_class = method.split(";")[0]
    return jni_class[1:]


# 获取方法名
def getMethod(method):
    jni_method = method.split(":")[0].split(".")[1]
    return jni_method


# 函数重载判断
def getoverloading_jni_method(method, alllists, jni_method):
    parlist = method.split("(")[1].split(")")[0]
    parlist = parlist.replace("java/lang/String;", "java_lang_String_2").replace("[", "_3")
    jni_methods = jni_method + "__" + parlist
    for lt in alllists:
        if lt == jni_methods:
            return jni_methods


# 获取nm命令获取到的函数，这里需要考虑到重载
def getClass_Method(method, dirs, alllists):
    # if method.startswith("Java_"):
    jni_method = method.split(":")[0].replace("_", "$").replace("/", "_").replace("$", "_1").replace(";.", "_")
    jni_method = "Java_" + jni_method[1:]
    flag = 0
    for lt in alllists:
        if lt == jni_method:
            flag = 1
            return jni_method
    if flag == 0:
        # 根据method来找到对应的重载函数
        jni_methods = getoverloading_jni_method(method, alllists, jni_method)
        if jni_methods != None:
            return jni_methods
        else:
            # 动态注册分析不出的话
            if dynamic_methods.ret_method(method, dirs) != "None":
                return dynamic_methods.ret_method(method, dirs)
    return ""
    # else:
    #     raise ToolsException("dynamic method failed or dynamic load.")


# 获取详细的方法名
def getMethods(method):
    jni_method = method.split(":")[0]
    return jni_method


# 获取参数信息
def getPara(method):
    jni_para = method.split(":")[1]
    return jni_para


# 获取定义
def define(method, i, st):
    list = convertType.create_types(method)
    if st.rstrip() == "static":
        data = "typedef " + switch_jni(list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jclass class,"
    else:
        data = "typedef " + switch_jni(list[1]) + " (*jni" + str(i) + "_t)(JNIEnv *env, jobject obj,"
    # 遍历参数
    num = 1
    for i in list[0]:
        data = data + switch_jni(i) + " i" + str(num) + ","
        num = num + 1
    data = data[:-1] + ");"
    return data


# 存入数据，确保格式
def write_c(f, data, lens):
    str = ""
    for i in range(lens):
        str = str + "    "
    str = str + data + "\n"
    f.write(str)


# 切换成jni模式
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


# 如果为-1，则表示之前存在相同的信息，返回第一个相同的下标
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


# 创建文件
def makefile(out_path, name):
    out = os.path.join(out_path, "outcome")
    if not os.path.exists(out):
        os.mkdir(out)
    out1 = os.path.join(out, name)
    if not os.path.exists(out1):
        os.mkdir(out1)


# 处理返回值
def deal_return(list):
    para_return = list[1].split(" ")[1]
    if para_return == "void":
        return ""
    else:
        return para_return


# 返回信息,env,class或者jobject
def deal_info(list):
    jni_method = list[1].split("*")[1].split("_")[0]
    jni_info = jni_method + "(env,"
    if list[1].split("*env,")[1].split(" ")[0] == "jobject":
        jni_info = jni_info + "obj" + str(list[2])
    else:
        jni_info = jni_info + "class" + str(list[2])
    return jni_info


# 给定默认维度，一维为5，二维为10
def gen_2demin(x=5, y=10, line="", num=0, totalsize=0):
    types = line.split("[][]")[0]
    if "type:" in types:
        types = types.split("type:")[1]
    # data = switch_jni(types)
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
    # data = data + space + "    (*env)->DeleteLocalRef(env, par" + str(num + 1) + ");\n"
    data = data + space + "}"
    list.append(data)
    list.append(",par" + str(num + 1))
    list.append("(*env)->DeleteLocalRef(env,par" + str(num + 1) + ");")
    totalsize = totalsize + x * y * btype_dict[types]
    num = num + 3
    return list, num, totalsize


# 处理基础类型
def deal_basic_type(out_path, t, num, totalsize, size, apkname):
    list = []
    # 字符串数组
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
            # Fuzz基础类型的数组
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


# 分析是否为污点，如果是污点的话，则赋初值
def analysis_line(out_path, line, num, size, totalsize, taintpath, apkname):
    list = []
    if line.split(":{is_tainted:")[1].split(",")[0] == "true":
        # 给污点赋予初值
        list, num = AddSource.addSource(out_path, line, num, list, taintpath, apkname)

    # 如果值为默认的话，根据类型Fuzz
    elif not line.split(", ")[1].split(":")[1] == "default":
        # 如果包含复杂类型的话
        if "[][]" in line.split("type:")[1] and "[][][]" not in line.split("type:")[1]:
            print("确定二维数组的维度.")
            # 对多维数组的维度进行计算,这里只考虑确定的2维数组
            # types = line.split("type:")[1].split("[][]")[0]
            x, y = line.split("[")[1].split("]")[0].split(", ")
            list, num, totalsize = gen_2demin(int(x), int(y), line, num, totalsize)
        # 单基础数组
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

        # 字符串
        elif line.split("type:")[1].rstrip() == "java.lang.String}":
            data = line.split(", ")[1].split(":")[1]
            data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + data + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
            num = num + 1
        # 基础类型
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
        # 这里是处理Fuzz数据部分
        types = line.split(", type:")[1][:-2]
        list, num, totalsize = deal_basic_type(out_path, types, num, totalsize, size, apkname)
    return list, num, totalsize


# 获取污点信息
def getTaintSource(file_path, taintHashFile):
    for k, v in taintHashFile.items():
        if k == file_path:
            return v


# 切割seed
def cut_seed(out_path, f, file_path, para_lists, size, apkname):
    f1 = open(file_path, "r")
    lines = f1.readlines()
    # 需要定义的变量数
    num = 0
    # 需要给定的字节大小
    totalsize = 0
    list_before = []
    list_after = []
    list_data = []
    data = ""
    for line in lines[1:]:
        # 对method进行处理
        if line.startswith("method:"):
            for para_list in para_lists:
                if para_list[0] in line:
                    if deal_return(para_list) != "":
                        data = data + deal_return(para_list) + " par" + str(num) + " = "
                        # 只有存在返回值才需要定义一个变量
                        num = num + 1
                    data = data + deal_info(para_list)
        elif line.strip() == "}":
            # write_c(f, data, 3)
            data = data + ");"
            list_data.append(data)
            # list_before.clear()
            # list_after.clear()
            data = ""
        elif line.startswith("p"):
            # 对每个参数进行求解
            # num为每个参数的个数，size为string字符串的长度，totalsize为所有的未知的字节数
            cans, num, totalsize = analysis_line(out_path, line, num, size, totalsize, lines[0], apkname)
            if len(cans) == 3:
                list_before.append(cans[0])
                data = data + cans[1]
                list_after.append(cans[2])
            elif len(cans) == 1:
                data = data + cans[0]
        elif line.startswith("dependence{"):
            break
    # 写入数据
    print(" [+] totalsize:", totalsize)
    write_c(f, "if(strlen(data)>=" + str(totalsize) + "){", 3)
    for be in list_before:
        write_c(f, be, 3)
    for da in list_data:
        write_c(f, da, 3)
    for er in list_after:
        if er != "":
            write_c(f, er, 3)
    write_c(f, "}", 3)
    return totalsize


# 根据so文件和列表信息来生成信息
def getc(out_path, name, method_list, so_list, file_path, size, so_graph):
    makefile(out_path, name)
    pt = file_path.split("_")[-1][:-4]
    # 在lib创建server.c文件
    f = open(out_path + "/outcome/" + name + "/server" + pt + ".c", "w", encoding='utf-8')
    f.write(c1)
    # 获取so文件以及对应的jni函数
    lens = len(so_list)
    informations = []
    para_lists = []
    # 不同架构导致lens为0
    if len(so_list) == 0:
        return
        raise ToolsException("not find the jni methods")
    count_so = 0
    for i in range(lens):
        info = []
        para_list = []
        # so文件路径，适用于dlopen
        info.append("/data/local/tmp/" + so_list[i] + ".so")
        # 函数signature
        info.append(method_list[i])
        # 判断是否为static
        if judge_static(file_path, method_list[i]):
            data = "static"
        else:
            data = "nostatic"
        info.append(data)
        # 类名
        info.append(getClass(method_list[i]))
        # 方法名
        info.append(getMethods(method_list[i]))
        # nm命令获取到的函数名
        dirs = out_path + os.sep + "Dmethods" + os.sep + name + "_Dmethods"
        info.append(getClass_Method(method_list[i], dirs, so_graph.get(so_list[i])))
        # 方法
        info.append(getMethod(method_list[i]))
        # 参数
        info.append(getPara(method_list[i]))
        # 函数的定义部分
        info.append(define(method_list[i], i, data))
        # for k in info:
        #    print(k)
        # print("=======")
        informations.append(info)
        # 如果在之前的列表中保存了该信息，则使用之前的信息
        para_list.append(method_list[i])
        if judge_before(informations, info, i, 0) == -1:
            write_c(f, "jstring str" + str(i) + " = \"" + info[0] + "\";", 1)
            write_c(f, "printf(\" [+] Loading target: [%s] \\n\", str" + str(i) + ");", 1)
            write_c(f, "void *handle" + str(i) + " = dlopen(str" + str(i) + ", RTLD_LAZY);", 1)
            write_c(f, "if(handle" + str(i) + " == NULL){", 1)
            write_c(f, "printf(\" [!] Could not dlopen the file! (%s)\\n\", dlerror());", 2)
            write_c(f, "}", 1)
            write_c(f, "", 0)
            if count_so == 0:
                f.write(c1_1)
            count_so = 1

            write_c(f, define(method_list[i], i, data), 1)
            para_list.append(define(method_list[i], i, data))
            write_c(f, "jni" + str(i) + "_t jni" + str(i) + " = dlsym(handle" + str(i) + ", \"" + info[5] + "\");",
                    1)
            write_c(f, "", 0)
        else:
            # 记住之前的定义即可
            write_c(f, define(method_list[i], i, data), 1)
            para_list.append(define(method_list[i], i, data))
            write_c(f, "jni" + str(i) + "_t jni" + str(i) + " = dlsym(handle" + str(
                judge_before(informations, info, i, 0)) + ", \"" + info[5] + "\");", 1)
            write_c(f, "", 0)
        write_c(f, "if(jni" + str(i) + " == NULL)", 1)
        write_c(f, "{", 1)
        write_c(f, "printf(\" [!] Could not dlsym the file! (%s) \\n\", dlerror());", 2)
        write_c(f, "return -2;", 2)
        write_c(f, "}else{", 1)
        write_c(f, "printf(\" [+] Found the function (%p)\\n\", jni" + str(i) + ");", 2)
        write_c(f, "}", 1)
        write_c(f, "", 0)
        # JNI函数一般都是不一样的
        if judge_before(informations, info, i, 3) == -1:
            write_c(f, "jclass class" + str(i) + " = (*env)->FindClass(env, \"" + info[3] + "\");", 1)
            write_c(f, "if(class" + str(i) + " == NULL){", 1)
            write_c(f, "printf(\" [!] Could not find the class on the class path\\n\");", 2)
            write_c(f, "return -3;", 2)
            write_c(f, "}else{", 1)
            write_c(f, "printf(\" [+] Found the Class: [%p]\\n\", class" + str(i) + ");", 2)
            write_c(f, "}", 1)
            write_c(f, "", 0)
            para_list.append(i)
            # 如果该jni函数为static，则执行，否则则不执行
            if data == "nostatic":
                write_c(f, "jobject obj" + str(i) + " = (*env)->AllocObject(env, class" + str(i) + ");", 1)

        else:
            para_list.append(judge_before(informations, info, i, 3))
        para_lists.append(para_list)

    f.write(c2)
    # 处理seed
    totalsize = cut_seed(out_path, f, file_path, para_lists, size, name)

    f.write(c3)
    f.close()
    return totalsize
