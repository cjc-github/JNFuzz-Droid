import os


def get_dynamic_method_name(java_method, dirs):
    if os.path.isdir(dirs):
        for p in os.listdir(dirs):
            if p.endswith(".so.result"):
                file = os.path.join(dirs, p)
                with open(file, "r") as f:
                    lines = f.readlines()
                    for i in lines:
                        row = i.split(", ")
                        if row[5] == "False\n":
                            cls = "L" + row[1].replace(".", "/") + ";."
                            med = row[2]
                            par = ":" + row[3]
                            if java_method == cls + med + par:
                                return row[4]
    return None


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
