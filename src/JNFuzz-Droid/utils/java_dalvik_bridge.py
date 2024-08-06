# deal return
def dalvik_fun_return2java(dict1, func_re):
    data = ""
    j = 0
    for i in range(len(func_re)):
        if func_re[i] == '[':
            j = j + 1
        elif func_re[i] in dict1:
            data = dict1.get(func_re[i])
            for _ in range(j):
                data = data + "[]"
    return data


# deal the parameters
def dalvik_fun_parameters2java(dict1, str1):
    stack = []
    tlist = []
    l = -1
    r = -1
    for i in range(len(str1)):
        # 避免存在Lcom/wiyun/engine/nodes/Director$IDirectorLifecycleListener;
        if str1[i] == 'L' and l == -1:
            l = i
        elif str1[i] == ';':
            r = i
            if l != -1 and r != -1:
                line = str1[l:r + 1]
                stack.append(line)
                l = -1
                r = -1
    for strg in stack:
        str1 = str1.replace(strg, "O", 1)
    for strg in stack:
        ort = strg[1:-1].replace("/", ".")
        if "$" not in ort:
            stim = "import " + ort + ";"
    j = 0
    for i in range(len(str1)):
        if str1[i] != '[':
            line = str1[j:i + 1]
            j = i + 1
            tlist.append(line)

    object1 = 0
    list1 = []
    for stg in tlist:
        tnk = ""
        num = 0
        for i in range(len(stg)):
            if stg[i] == '[':
                num = num + 1
            elif stg[i] == 'O':
                ob = stack[object1]
                object1 = object1 + 1
                ob = ob.split("/")[len(ob.split("/")) - 1]
                ob = ob.split("$")[len(ob.split("$")) - 1]
                ob = ob.replace(";", "")
                tnk = tnk + ob
                # tnk=tnk+stack[object1]
            else:
                if dict1.get(stg[i]):
                    tnk = tnk + dict1.get(stg[i])
                # tnk = tnk + dict1.get(stg[i])
        for i in range(num):
            tnk = tnk + "[]"
        list1.append(tnk)
    return list1


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
    java_return = dalvik_fun_return2java(dict1, func_return)
    return [java_parameters, java_return]


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
    ret1 = ""
    flag = 0
    for i in dict1:
        if ret.startswith(i):
            flag = 1
            num = ret.count("[]")
            ret1 = "[" * num + dict1.get(i)
    if flag == 0:
        ret1 = "L" + ret.replace(".", "/") + ";"
    pars1 = ""
    if pars == "":
        pars1 = ""
    elif "," not in pars:
        flag = 0
        for k in dict1:
            if pars.startswith(k):
                flag = 1
                num = pars.count("[]")
                pars1 += "[" * num + dict1.get(k)
        if flag == 0:
            pars1 += "L" + ret.replace(".", "/") + ";"
    else:
        for i in pars.split(","):
            flag = 0
            for j in dict1:
                if i.startswith(j):
                    flag = 1
                    num = i.count("[]")
                    pars1 += "[" * num + dict1.get(j)
            if flag == 0:
                pars1 += "L" + ret.replace(".", "/") + ";"
    return ret1, pars1


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

    sig = "Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V"
    java_sig = dalvik2java_type(sig)
    print(java_sig)
    sig = java2dalvik_type(java_sig)
    print(sig)
