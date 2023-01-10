# 处理返回值
def deal2(dict1, func_re):
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


# 处理函数中的参数
def deal1(dict1, str1):
    # 处理jawa/smali中的复杂类型
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
    # 复杂类型中的$替换
    for strg in stack:
        str1 = str1.replace(strg, "O", 1)
    # 保存下复杂类型，方便import等操作
    for strg in stack:
        ort = strg[1:-1].replace("/", ".")
        if "$" not in ort:
            stim = "import " + ort + ";"
    # 将数据拆分成单个数据类型
    j = 0
    for i in range(len(str1)):
        if str1[i] != '[':
            line = str1[j:i + 1]
            j = i + 1
            tlist.append(line)

    # 类型转换，变成java的基础类型
    object1 = 0
    list1 = []
    # 数据类型转换
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


# 返回参数类型列表
def create_types(func):
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
    func_para = func.split("(")[1].split(")")[0]
    func_re = func.split(")")[1]
    func_para = func_para.replace("Ljava/lang/String;", "T")
    func_re = func_re.replace("Ljava/lang/String;", "T")
    list = []
    data1 = deal1(dict1, func_para)
    data2 = deal2(dict1, func_re)
    # data2 = deal1(dict1, func_re)
    list.append(data1)
    list.append(data2)
    return list


# 获取参数
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
    # 返回值
    ret1 = ""
    flag = 0
    for i in dict1:
        if ret.startswith(i):
            flag = 1
            num = ret.count("[]")
            ret1 = "[" * num + dict1.get(i)
    if flag == 0:
        ret1 = "L" + ret.replace(".", "/") + ";"
    # 多个参数
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
