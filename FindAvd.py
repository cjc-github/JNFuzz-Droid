import datetime
import os
import signal
import subprocess
import sys
import time

from utils import utils, dynamic_methods
from utils.changejs import changejs
from utils.exception import ToolsException, HaveException
from write_toc import getc, getClass_Method
from utils import prepare_frida


def get_method(apk_scripts, file):
    list = []
    file_path = os.path.join(apk_scripts, file)
    with open(file_path, "r") as f:
        lines = f.readlines()
    f.close()
    methods = lines[1][10:-2]
    for i in methods.split(","):
        list.append(i.split(" ")[0])
    return list


def judge(v, i):
    if "__" in v:
        v = v.split("__")[0]
    data = v.replace("Java_", "L").replace("_1", "$")
    lens = len(data.split("_"))
    data = data.replace("_", "/", lens - 2).replace("_", ";.").replace("$", "_")
    if i.split(":")[0] == data:
        return True
    else:
        return False

def get_solist(method_list, so_graph):
    list1 = []
    for i in method_list:
        for k in so_graph.keys():
            # lib开头
            if k.startswith("lib"):
                for v in so_graph[k]:
                    if v.startswith("Java_") and judge(v, i):
                        list1.append(k)
                        break
                    elif not v.startswith("Java_"):
                        if v == i:
                            list1.append(k)
    # list1 = list(set(list1))
    return list1

def copyandexec(file_path, gcc, totalsize, arch, apkname, so_list, fuzz_one):
    pt = file_path.split("_")[-1][:-4]
    out_path = file_path.replace("scripts", "outcome").replace("script_", "server").replace(".txt", ".c")

    cmd = "adb shell su -c 'cd /data/local/tmp;rm -rf client server'"
    print(cmd)
    os.system(cmd)
    cmd = "cp " + out_path + " ./lib/examples/server.c"
    print(cmd)
    os.system(cmd)
    os.system("cd lib/examples/;" + gcc + " -o client client.c ../lib/spsc.c " +
              "-I ../lib -lspsc -L ../lib -Wall -O3 -w")
    cmd = "cd lib/examples/;" + gcc + " -o server server.c ../lib/spsc.c " + \
          "../lib/vm.c -I ../lib -lspsc -L ../lib -Wall -O3 -ldl -Wl,--export-dynamic -w"
    os.system(cmd)
    if not os.path.exists("lib/examples/server"):
        return
        # raise HaveException("generation server failed.")

    os.system("adb push lib/examples/client /data/local/tmp")
    os.system("adb push lib/examples/server /data/local/tmp")


    if totalsize != 0:
        seed = "0" * totalsize
    else:
        seed = "0000"
    cmd = "adb shell 'cd /data/local/tmp;mkdir in;echo \"" + seed + "\" > in/1\'"
    print(cmd)
    os.system(cmd)


    # cmd1 = 'gnome-terminal -t frida-server -- bash -c "adb shell < utils_cmd/start-frida-server.txt;exec bash"'
    cmd1 = 'gnome-terminal -t frida-server -- bash -c "adb shell < utils_cmd/start-server.txt;exec bash"'
    # cmd2 = 'gnome-terminal -t Hook -- bash -c "python3 test_hook.py;exec bash"'
    # info = apkname + "path" + pt
    # cmd2 = 'gnome-terminal -t Hook -- bash -c "python3 hook1.py ' + info + ';exec bash"'
    # cmd="gnome-terminal -t jnitrace -- bash -c 'jnitrace -l libintent.so -m spawn /data/local/tmp/server;exec bash'"
    # if fuzz_one:
    #    cmd3 = 'gnome-terminal -t client -- bash -c "adb shell < utils_cmd/start-client.txt;exec bash"'
    # else:
    cmd3 = 'gnome-terminal -t AFL-Fuzz -- bash -c "adb shell < utils_cmd/start-afl.txt;exec bash"'

    # kill gnome-terminal
    # server
    ans = []
    p1 = subprocess.Popen(cmd1, shell=True, preexec_fn=os.setsid)
    time.sleep(3)
    bash_pids = subprocess.check_output(["pidof", "bash"])
    bash_pids = bash_pids.decode('UTF-8', 'strict')
    pid_to_kill = bash_pids.split(" ")[0]
    ans.append(pid_to_kill)
    time.sleep(20)

    # client
    # p2 = subprocess.Popen(cmd2, shell=True, preexec_fn=os.setsid)
    # time.sleep(3)
    # bash_pids = subprocess.check_output(["pidof", "bash"])
    # bash_pids = bash_pids.decode('UTF-8', 'strict')
    # pid_to_kill = bash_pids.split(" ")[0]
    # ans.append(pid_to_kill)
    # time.sleep(20)

    # client
    p3 = subprocess.Popen(cmd3, shell=True, preexec_fn=os.setsid)
    time.sleep(3)
    bash_pids = subprocess.check_output(["pidof", "bash"])
    bash_pids = bash_pids.decode('UTF-8', 'strict')
    pid_to_kill = bash_pids.split(" ")[0]
    ans.append(pid_to_kill)

    # Fuzz time
    time.sleep(60)

    for i in ans:
        os.kill(int(i), signal.SIGTERM)

    # time.sleep(260)
    cmd = "adb shell < utils_cmd/remove-exec.txt"
    print(" [+] kill the afl ,frida pid and ash memory.")
    # print(cmd)
    # os.system(cmd)



def judge_repeat_so(folder):
    if os.path.exists(folder):
        lst = []
        if os.path.exists(os.path.join(folder, "arm64-v8a")):
            lst.append(os.listdir(os.path.join(folder, "arm64-v8a")))
        if os.path.exists(os.path.join(folder, "armeabi-v7a")):
            lst.append(os.listdir(os.path.join(folder, "armeabi-v7a")))
        if os.path.exists(os.path.join(folder, "armeabi")) and os.path.isdir(os.path.join(folder, "armeabi")):
            lst.append(os.listdir(os.path.join(folder, "armeabi")))
        if len(lst) == 1:
            return True
        elif len(lst) == 2:
            return sorted(lst[1]) == sorted(lst[0])
        else:
            return sorted(lst[0]) == sorted(lst[1]) == sorted(lst[2])
    else:
        return True


class FindAvd:
    def __init__(self, name, out_path):
        self.apkname = utils.get_apkname(name)
        self.name = name
        self.out_path = out_path
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"
        self.Script_path = out_path + "/scripts"
        self.dynamic_methods = out_path + "/Dmethods"
        self.arch = ""
        self.gcc = ""
        self.size = str(10)

    def copy_sofile(self):
        if judge_repeat_so(os.path.join(self.Decompile_path, self.apkname, "lib")):
            so_path = os.path.join(self.Decompile_path, self.apkname, "lib", self.arch)
            cmd = "adb push " + so_path + "/* /data/local/tmp"
            os.system(cmd)
        else:
            print(" [*] the apk exists the difficult so file in different abi.")
            folder = os.path.join(self.Decompile_path, self.apkname, "lib")
            if os.path.exists(os.path.join(folder, "arm64-v8a")):
                cmd = "adb push " + folder + "/arm64-v8a/* /data/local/tmp"
                os.system(cmd)
            if os.path.exists(os.path.join(folder, "armeabi-v7a")):
                cmd = "adb push " + folder + "/armeabi-v7a/* /data/local/tmp"
                os.system(cmd)
            if os.path.exists(os.path.join(folder, "armeabi")):
                cmd = "adb push " + folder + "/armeabi/* /data/local/tmp"
                os.system(cmd)


    def add_other_arch(self, name):
        list1 = ["x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a"]
        res = []
        for i in list1:
            so_files = os.path.join(self.out_path, "decompile", name, "lib", i)
            if os.path.isdir(so_files):
                res.append(so_files)
        return res


    def Fuzz_apk(self, so_graph, gcc, fuzz_one):
        jn_apk = utils.deal_apk(self.name)
        os.system("adb push " + jn_apk + " /data/local/tmp/target-app.apk")
        apk_scripts = os.path.join(self.Script_path, self.apkname)
        self.copy_sofile()
        if os.path.exists(apk_scripts):
            for i in os.listdir(apk_scripts):
                if True:
                # if i == "script_t7.txt":
                    print(self.name, i, i, i, i, i, i, sep="\n")
                    file_path = os.path.join(apk_scripts, i)

                    method_list = get_method(apk_scripts, i)
                    so_list = get_solist(method_list, so_graph)
                    # print("221", method_list)
                    # print("222", so_list)
                    dirs = self.out_path + os.sep + "Dmethods" + os.sep + self.apkname + "_Dmethods"

                    try:
                        res = []
                        for j in range(len(method_list)):
                            if j < len(so_list):
                                tmp = [so_list[j], getClass_Method(method_list[j], dirs, so_graph.get(so_list[j]))]
                                res.append(tmp)

                        totalsize = getc(self.out_path, self.apkname, method_list, so_list, file_path, self.size,
                                         so_graph)

                        changejs(res, file_path)
                        copyandexec(file_path, gcc, totalsize, self.arch, self.apkname, so_list, fuzz_one)
                    except Exception as e:
                        line = file_path + " generate the server.c failed."
                        utils.save_file(self.out_path, line)
                        print("geneate the server.c failed")
            # finish
            cmd = "adb shell 'cd /data/local/tmp;su -c rm -rf lib* test_jni* *.apk out in *.so target-app.apk'"
            print(cmd)
            os.system(cmd)

        print(" [+] Finish the Fuzz.")


    def generate_jni(self, name):

        so_graphs = dict()
        lib_folder = os.path.join(self.Decompile_path, name, "lib")
        so_files = os.path.join(self.Decompile_path, name, "lib", self.arch)
        if not judge_repeat_so(lib_folder):
            all_so_files = self.add_other_arch(name)
        else:
            all_so_files = [so_files]
        for so_files in all_so_files:
            if os.path.isdir(so_files):
                for i in os.listdir(so_files):
                    so_path = os.path.join(so_files, i)
                    if i.endswith(".so"):
                        key = i[:-3]
                    else:
                        key = i

                    if not so_graphs.__contains__(key):
                        so_graphs[key] = []
                    cmd = "nm -D " + so_path + " | grep ' Java_' | awk '{print $3}'"
                    res = os.popen(cmd)
                    for line in res:
                        so_graphs[key].append(line.strip())
            else:
                print("arch not exist! error!")
        folder = self.dynamic_methods + os.sep + self.apkname + "_Dmethods"
        mets = dynamic_methods.get_dmethods_map(folder)
        for k in mets:
            if k not in so_graphs:
                so_graphs[k] = []
            for v1 in mets.get(k):
                cls = "L" + v1[0].replace(".", "/") + ";."
                med = v1[1]
                par = ":" + v1[2]
                so_graphs[k].append(cls + med + par)
                # so_graphs[k].append(v1[3])
        return so_graphs

    # arm64-v8a，armeabi-v7a,armeabi,x84,x86_64
    def find_arch(self, fuzz_one):
        if not utils.judge_input(self.name):
            print(" [*] the input_apk is not exist.")
            exit(0)

        print(" [+] Find the apk architecture.")
        parent_abi = os.path.join(self.Decompile_path, self.apkname, "lib")
        so_files = []
        for abi in os.listdir(parent_abi):
            so_files.append(abi)
        if "arm64-v8a" in so_files:
            self.gcc = "/home/cao/Android/Sdk/ndk/android-standalone-toolchain-arm64/bin/aarch64-linux-android-gcc"
            self.arch = "arm64-v8a"
        elif "armeabi-v7a" in so_files:
            self.gcc = "/home/cao/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-gcc"
            self.arch = "armeabi-v7a"
        elif "armeabi" in so_files:
            self.gcc = "/home/cao/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-gcc"
            self.arch = "armeabi"
        elif "x86_64" in so_files:
            self.gcc = "/home/cao/Android/Sdk/ndk/android-standalone-toolchain-x86_64/bin/x86_64-linux-android-gcc"
            self.arch = "x86_64"
        elif "x86" in so_files:
            self.gcc = "/home/cao/Android/Sdk/ndk/android-standalone-toolchain-x86/bin/i686-linux-android-gcc"
            self.arch = "x86"
        else:
            print(" [*] The apk don't have the arm or x8r arch.")
            raise ToolsException(" [+]" + self.apkname + "\n The apk don't have the arm or x86 arch.")

        if not os.path.exists(self.out_path + "/methods"):
            os.system("mkdir " + self.out_path + "/methods")
        if not os.path.exists(self.out_path + "/methods/" + self.apkname):
            os.system("mkdir " + self.out_path + "/methods/" + self.apkname)

        so_graph = self.generate_jni(self.apkname)
        os.system("cd lib/lib; build.sh " + self.arch)

        flag = 0
        for k, v in so_graph.items():
            if len(v) != 0:
                flag = 1
        if flag == 1:
            print(" [+] Fuzz...")
            self.Fuzz_apk(so_graph, self.gcc, fuzz_one)
        else:
            print(" [*] The so file cannot the hash jni method...\n\n\nfinish...")
            raise ToolsException(" [+]" + self.apkname + "\n The apk don't have find the jni method.")


if __name__ == "__main__":
    # apk_path = "apk/Native1.apk"
    # out_paths = "out"
    # python FindAvd.py apk/Native1.apk out
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    avd = FindAvd(apk_path, out_paths)
    avd.find_arch(False)
