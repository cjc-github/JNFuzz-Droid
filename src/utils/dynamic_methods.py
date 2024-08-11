import os


# get the dynamic method
def get_dynamic_method_name(java_method, dirs):
    lines = []
    if os.path.isdir(dirs):
        for p in os.listdir(dirs):
            if p.endswith(".so.result"):
                file = os.path.join(dirs, p)
                with open(file, "r") as f:
                    lines = f.readlines()
    for i in lines:
        row = i.strip().split(", ")
        if row[5] == "False":
            cls = "L" + row[1].replace(".", "/") + ";."
            if java_method == cls + row[2] + ":" + row[3]:
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
                        infos = i.strip().split(", ")
                        if infos[5] == "False":
                            tmp = [infos[1], infos[2], infos[3], infos[4]]
                            maps[sofile].append(tmp)
        return maps
    else:
        return None
