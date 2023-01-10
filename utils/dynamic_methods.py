import os


# 返回native函数
def ret_method(method, dirs):
    if os.path.isdir(dirs):
        for p in os.listdir(dirs):
            if p.endswith(".so.result"):
                file = os.path.join(dirs, p)
                sofile = p[:-10]
                with open(file, "r") as f:
                    lines = f.readlines()
                    for i in lines:
                        infos = i.split(", ")
                        if infos[5] == "False\n":
                            cls = "L" + infos[1].replace(".", "/") + ";."
                            med = infos[2]
                            par = ":" + infos[3]
                            if method == cls + med + par:
                                return infos[4]


# 获取动态加载函数
def get_dmethods_map(dirs):
    maps = {}
    if os.path.isdir(dirs):
        for p in os.listdir(dirs):
            if p.endswith(".so.result"):
                file = os.path.join(dirs, p)
                sofile = p[:-10]
                maps[sofile] = []
                with open(file, "r") as f:
                    lines = f.readlines()
                    for i in lines:
                        infos = i.split(", ")
                        if infos[5] == "False\n":
                            tmp = [infos[1], infos[2], infos[3], infos[4]]
                            maps[sofile].append(tmp)
                f.close()
        return maps
    else:
        return None


'''
# 获取动态加载函数
def get_dmethods_list(dirs):
    maps = []
    if os.path.isdir(dirs):
        for p in os.listdir(dirs):
            if p.endswith(".so.result"):
                file = os.path.join(dirs, p)
                with open(file, "r") as f:
                    lines = f.readlines()
                    for i in lines:
                        infos = i.split(", ")
                        if infos[5] == "False\n":
                            tmp = [infos[1], infos[2], infos[3], infos[4]]
                            maps.append(tmp)
                f.close()
        return maps
    else:
        return None
'''

'''
# 对Taint.txt文件进行处理
def deal_dynamic_taint(dynamic_folder, apk_name, taint_txt):
    folder = dynamic_folder + os.sep + apk_name + "_Dmethods"
    mets = get_dmethods_list(folder)
    if mets is not None:
        infos = []
        with open(taint_txt, "r") as f:
            lines = f.readlines()
            for line in lines:
                newline = []
                newline.append(line.split(" ===> ")[0])
                funs = line.split(" ===> ")[1:]
                for fun in funs:
                    flag = 0
                    for met in mets:
                        cls = "L" + met[0].replace(".", "/") + ";."
                        med = met[1]
                        par = ":" + met[2]
                        if fun.split(" ")[0] == cls + med + par:
                            flag = 1
                            newline.append(cls + met[3] + par + " " + fun.split(" ")[1])
                    if flag == 0:
                        newline.append(fun)
                infos.append(" ===> ".join(newline))
        f.close()
        with open(taint_txt, "w") as f:
            for i in infos:
                f.write(i)
        f.close()
'''
