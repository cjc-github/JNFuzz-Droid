from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


# deal the parameters
def dalvik_fun_parameters2java(dict1, str1):
    para_index, para_list, import_list = [], [], []

    # record each parameter index
    left, right = -1, -1
    for index, value in enumerate(str1):
        if value == 'L' and left == -1:
            left = index
        elif value == ";":
            para_index.append(index + 1)
            left = -1
        elif value in dict1 and left == -1:
            para_index.append(index + 1)

    # record each parameter dalvik
    for i in range(0, len(para_index)):
        if i == 0:
            para_list.append(str1[0:para_index[i]])
        else:
            para_list.append(str1[para_index[i - 1]:para_index[i]])

    # record each parameter java
    for index, value in enumerate(para_list):
        array_level_num = 0
        for k, v in enumerate(value):
            if v == '[':
                array_level_num += 1
            elif v == 'L':
                import_list.append(value[k + 1:-1].replace("/", "."))
                para_list[index] = value[k + 1:-1].replace("/", ".") + "[]" * array_level_num
                break
            elif v in dict1:
                para_list[index] = dict1[v] + "[]" * array_level_num
                break
    return para_list


# Dalvik type to java type
def create_types(dalvik_function):
    dict1 = {"V": "void",
             "Z": "boolean",
             "B": "byte",
             "S": "short",
             "C": "char",
             "I": "int",
             "J": "long",
             "F": "float",
             "D": "double",
             "T": "java.lang.String"}
    func_parameters = dalvik_function.split("(")[1].split(")")[0]
    func_return = dalvik_function.split(")")[1]

    func_parameters = func_parameters.replace("Ljava/lang/String;", "T")
    func_return = func_return.replace("Ljava/lang/String;", "T")

    java_parameters = dalvik_fun_parameters2java(dict1, func_parameters)
    java_return = dalvik_fun_parameters2java(dict1, func_return)[0]

    return [java_parameters, java_return]


def return_java_type(dict1, each_parameter):
    array_level = each_parameter.count("[]") * '['
    each_parameter = each_parameter.replace("[]", "")
    if "." in each_parameter:
        return array_level + "L" + each_parameter.replace(".", "/") + ";"
    elif each_parameter in dict1:
        return array_level + dict1[each_parameter]
    elif each_parameter == "":
        return ""
    else:
        log.error("[!] the type not found.")
        # print(f"[!] the type {each_parameter} not found.")


# deal return value and parameters
def get_type(ret, pars):
    dict1 = {"void": "V",
             "boolean": "Z",
             "byte": "B",
             "short": "S",
             "char": "C",
             "int": "I",
             "long": "J",
             "float": "F",
             "double": "D",
             "java.lang.String": "Ljava/lang/String;",
             }

    dalvik_ret = return_java_type(dict1, ret)

    dalvik_pars = ""
    if "," in pars:
        for i in pars.split(","):
            dalvik_pars += return_java_type(dict1, i)
    else:
        dalvik_pars = return_java_type(dict1, pars)

    return dalvik_ret, dalvik_pars


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


# Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V
# <org.arguslab.native_leak.MainActivity: void send(java.lang.String)>
if __name__ == "__main__":
    # test1
    # function = "Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V"
    # print(create_types(function))
    # function = "Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;Lcom/wiyun/engine/nodes/Director$IDirectorLifecycleListener;)Lcom/wiyun/engine/nodes/Director$IDirectorLifecycleListener;"
    # print(create_types(function))
    # function = "Lorg/arguslab/native_leak/MainActivity;.send:(ZBSCIJFDLjava/lang/String;)V"
    # print(create_types(function))
    # function = "Lorg/arguslab/native_leak/MainActivity;.send:([[Z[Ljava/lang/String;)V"
    # print(create_types(function))
    # function = "Lorg/arguslab/native_leak/MainActivity;.send:([[Z[Lcom/wiyun/engine/nodes/Director;)V"
    # print(create_types(function))

    # ret = "com.wiyun.engine.nodes"
    # par = "java.lang.String"
    # print(get_type(ret, par))

    # test2 for dalvik -> java ->dalvik
    try:
        res, num = [], 0
        with open("dalvik_method.txt", "r") as f:
            lines = f.readlines()
            for i in lines:
                java_sig = dalvik2java_type(i)

                sig = java2dalvik_type(java_sig)
                res.append(sig)

                if i.strip() != sig:
                    print("before:", i.strip())
                    print("after :", java_sig)
                    print("netxt :", sig, "\n")
                else:
                    num = num + 1
        print("num: ", num)
    except Exception as e:
        print(f"error{e}")

    # test2.1 for java -> dalvik -> java
    # try:
    #     res, num = [], 0
    #     with open("java_method.txt", "r") as f:
    #         lines = f.readlines()
    #         for i in lines:
    #             sig = java2dalvik_type(i)
    #             java_sig = dalvik2java_type(sig)
    #
    #             res.append(java_sig)
    #
    #             if i.strip() != java_sig:
    #                 print("before:", i.strip())
    #                 print("after :", sig)
    #                 print("netxt :", java_sig, "\n")
    #             else:
    #                 num = num + 1
    #     print("num: ", num)
    # except Exception as e:
    #     print(f"error{e.args}")

    # test3
    # sig = "Lde/ecspride/MainActivity$PlaceholderFragment;.onCreateView:(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"
    # # sig = "Lde/ecspride/MainActivity;.onCreate:(VSCIJLandroid/os/Bundle;[Lcom/e$er;ZBVSCIJ[[[FDT)V"
    # print("sig: ", sig)
    # java_sig = dalvik2java_type(sig)
    # print("java sig: ", java_sig)
    # sig = java2dalvik_type(java_sig)
    # print("sig: ", sig)
