# 获取参数
import os
import xml
from xml.dom import minidom


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


def changeFlowtoAmd(Flowdroid_method):
    cls = Flowdroid_method[1:].split(":")[0]
    met = Flowdroid_method.split(" ")[2].split("(")[0]
    ret = Flowdroid_method.split(" ")[1]
    pars = Flowdroid_method.split("(")[1].split(")")[0]
    ret1, pars1 = get_type(ret, pars)
    ans = "L" + cls.replace(".", "/") + ";." + met + ":(" + pars1 + ")" + ret1
    return ans


def getcon_method(mth):
    return "<" + mth.split("<")[1].split(">")[0] + ">"


if __name__ == "__main__":
    path = "/media/cao/C盘/python_test/run_flowdroid/mal1_500_out/flowdroid_engine"
    if os.path.exists(path):
        for file in os.listdir(path):
            leak_file = os.path.join(path, file)
            if os.path.getsize(leak_file) == 12:
                print("timeout")
            else:
                DOMTree = xml.dom.minidom.parse(leak_file)
                collection = DOMTree.documentElement
                Results = collection.getElementsByTagName("Result")
                if not Results:
                    print(" [*] Results is empty")
                    # raise HaveException("FlowDroid can't find the taint path")
                else:
                    for result in Results:
                        Sources = result.childNodes[1].childNodes
                        Sink = result.childNodes[0]
                        for Source in Sources:
                            # 对每一条leak信息进行处理
                            con_source = Source.getAttribute("Statement")
                            con_sink = Sink.getAttribute("Statement")
                            x = getcon_method(con_source)
                            print("b:" + x)
                            print("a:" + changeFlowtoAmd(x))
                            print("\n")
                            y = getcon_method(con_sink)
                            print("b:" + y)
                            print("a:" + changeFlowtoAmd(y))
                            print("\n")
