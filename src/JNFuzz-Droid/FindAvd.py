import datetime
import os
import signal
import subprocess
import sys
import time

from utils import utils, dynamic_methods
from utils.changejs import changejs
from utils.exception import ToolsException
from write_toc import getc, getClass_Method


def get_method(apk_scripts, file):
    file_path = os.path.join(apk_scripts, file)
    with open(file_path, "r") as f:
        lines = f.readlines()
    f.close()
    methods = lines[1][10:-2]
    met = methods.split(" ")[0]
    return met


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
    list1 = ""
    for k in so_graph.keys():
        if k.startswith("lib"):
            for v in so_graph[k]:
                if v.startswith("Java_") and judge(v, method_list):
                    list1 = k
                    break
                elif not v.startswith("Java_"):
                    if v == method_list:
                        list1 = k
    return list1


def copyandexec(file_path, gcc, totalsize, apk_name, fuzz_one, fuzz_time):
    pt = file_path.split("_")[-1][:-4]
    out_path = file_path.replace("scripts", "outcome").replace("script_", "server").replace(".txt", ".cpp")
    cmd = "adb shell su -c 'cd /data/local/tmp;rm -rf client server'"
    print(cmd)
    os.system(cmd)

    cmd = "cp " + out_path + " ./lib/examples/server.cpp"
    print(cmd)
    os.system(cmd)

    os.system("cd lib/examples/;" + gcc + " -o client client.c ../lib/spsc.c " +
              "-I ../lib -lspsc -L ../lib -Wall -O3 -w")
    # cmd = "cd lib/examples/;" + gcc + " -std=c++17 -o server server.cpp ../lib/spsc.c " + \
    #      "-I ../lib -lspsc -L ../lib -Wall -O3 -ldl -Wl,--export-dynamic -w"
    cmd = "cd lib/examples/;" + gcc + " -std=c++17 -o server server.cpp ../lib/spsc.c " + \
          "-I ../lib -lspsc -L ../lib -Wall -O3 -ldl -Wl,--export-dynamic,-rpath=/data/local/tmp -w -lc++_shared"
    print(cmd)
    os.system(cmd)

    if not os.path.exists("lib/examples/server"):
        return

    os.system("adb push lib/examples/client /data/local/tmp")
    os.system("adb push lib/examples/server /data/local/tmp")
    # os.system("adb push lib/examples/")

    if totalsize != 0:
        seed = "0" * totalsize
    else:
        seed = "0000"
    cmd = "adb shell 'cd /data/local/tmp;mkdir in;echo \"" + seed + "\" > in/1\'"
    # print(cmd)
    os.system(cmd)

    cmd1 = 'gnome-terminal -t frida-server -- bash -c "adb shell < utils_cmd/start-frida-server.txt;exec bash"'
    info = apk_name + "path" + pt
    cmd2 = 'gnome-terminal -t Hook -- bash -c "python3 frida_hook.py ' + file_path + ';exec bash"'
    # cmd2 = 'gnome-terminal -t Hook -- bash -c "python3 frida_hook.py ' + info + ';exec bash"'
    if fuzz_one:
        cmd3 = 'gnome-terminal -t client -- bash -c "adb shell < utils_cmd/start-client.txt;exec bash"'
    else:
        cmd3 = 'gnome-terminal -t AFL-Fuzz -- bash -c "adb shell < utils_cmd/start-afl.txt;exec bash"'

    ans = []
    p1 = subprocess.Popen(cmd1, shell=True, preexec_fn=os.setsid)
    time.sleep(3)
    bash_pids = subprocess.check_output(["pidof", "bash"])
    bash_pids = bash_pids.decode('UTF-8', 'strict')
    pid_to_kill = bash_pids.split(" ")[0]
    ans.append(pid_to_kill)
    time.sleep(10)

    p2 = subprocess.Popen(cmd2, shell=True, preexec_fn=os.setsid)
    time.sleep(3)
    bash_pids = subprocess.check_output(["pidof", "bash"])
    bash_pids = bash_pids.decode('UTF-8', 'strict')
    pid_to_kill = bash_pids.split(" ")[0]
    ans.append(pid_to_kill)
    time.sleep(15)

    p3 = subprocess.Popen(cmd3, shell=True, preexec_fn=os.setsid)
    time.sleep(3)
    bash_pids = subprocess.check_output(["pidof", "bash"])
    bash_pids = bash_pids.decode('UTF-8', 'strict')
    pid_to_kill = bash_pids.split(" ")[0]
    ans.append(pid_to_kill)

    time.sleep(fuzz_time)

    for i in ans:
        os.kill(int(i), signal.SIGTERM)

    cmd = "adb shell < utils_cmd/remove-exec.txt"
    print(" [+] kill the afl ,frida pid and ash memory.")
    os.system(cmd)


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
    def __init__(self, name, out_path, arch, fuzz_one, fuzz_time):
        self.apkname = utils.get_apkname(name)
        self.name = name
        self.out_path = out_path
        self.arch = arch
        self.fuzz_one = fuzz_one
        self.fuzz_time = fuzz_time
        self.gcc = ""
        self.size = str(10)
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"
        self.Script_path = out_path + "/scripts"
        self.dynamic_methods = out_path + "/Dmethods"

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
        os.system("adb push " + jn_apk + " /data/local/tmp")
        apk_scripts = os.path.join(self.Script_path, self.apkname)
        self.copy_sofile()
        if os.path.exists(apk_scripts):
            for i in os.listdir(apk_scripts):
                # if i == "script_4.txt":
                if True:
                    print(" [+] running the ", self.name, i, "\n")
                    file_path = os.path.join(apk_scripts, i)
                    java_method = get_method(apk_scripts, i)
                    so_file = get_solist(java_method, so_graph)
                    dirs = self.out_path + os.sep + "Dmethods" + os.sep + self.apkname + "_Dmethods"

                    try:
                        target_native_name = getClass_Method(java_method, dirs, so_graph.get(so_file))
                        # dynamic register or other
                        totalsize = getc(self.out_path, self.apkname, java_method, target_native_name, so_file,
                                         file_path, self.size)
                        changejs(target_native_name, so_file, file_path)
                        copyandexec(file_path, gcc, totalsize, self.apkname, fuzz_one, self.fuzz_time)
                    except Exception as e:
                        line = file_path + " generate the server.c failed."
                        utils.save_file(self.out_path, line)
                        print("geneate the server.c failed")

            cmd = "adb shell 'cd /data/local/tmp;su -c rm -rf lib* test_jni* *.apk out in *.so target-app.apk'"
            print(cmd)
            os.system(cmd)

        print(" [+] Finish the Fuzz.")

    # if the naitve method is static register,
    # for example {libantive-so,[Java_org_cao_atoll_send]}
    # if the native method is dynamic register,
    # for example {libegamepay,[Lcn/egame/terminal/paysdk/jni/EgamePayProtocol;.init:(Landroid/content/Context;)Lcn/egame/terminal/paysdk/jni/ProtocolMessage;]}
    def generate_jni(self, name):
        so_graphs = dict()
        lib_folder = os.path.join(self.Decompile_path, name, "lib")
        so_files = os.path.join(self.Decompile_path, name, "lib", self.arch)

        # If so files are different in different architecture, add different architecture
        if not judge_repeat_so(lib_folder):
            all_so_files = self.add_other_arch(name)
        else:
            all_so_files = [so_files]

        # static register
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
                print(" [!] arch not exist! error!")

        # dynamic register
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

    def performance_first(self):
        parent_abi = os.path.join(self.Decompile_path, self.apkname, "lib")
        so_files = []
        for abi in os.listdir(parent_abi):
            so_files.append(abi)
        if "arm64-v8a" in so_files:
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm64/bin/aarch64-linux-android-g++"
            self.arch = "arm64-v8a"
        elif "armeabi-v7a" in so_files:
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++"
            self.arch = "armeabi-v7a"
        elif "armeabi" in so_files:
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++"
            self.arch = "armeabi"
        elif "x86_64" in so_files:
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-x86_64/bin/x86_64-linux-android-g++"
            self.arch = "x86_64"
        elif "x86" in so_files:
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-x86/bin/i686-linux-android-g++"
            self.arch = "x86"
        else:
            print(" [*] The apk don't have the arm or x86 arch.")
            raise ToolsException(" [+]" + self.apkname + "\n The apk don't have the arm or x86 arch.")

    def select_abi(self):
        if self.arch == "arm64-v8a":
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm64/bin/aarch64-linux-android-g++"
            self.arch = "arm64-v8a"
        elif self.arch == "armeabi-v7a":
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++"
            self.arch = "armeabi-v7a"
        elif self.arch == "armeabi":
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++"
            self.arch = "armeabi"
        elif self.arch == "x86":
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-x86/bin/i686-linux-android-g++"
            self.arch = "x86"
        elif self.arch == "x86_64":
            self.gcc = "~/Android/Sdk/ndk/android-standalone-toolchain-x86_64/bin/x86_64-linux-android-g++"
            self.arch = "x86_64"
        else:
            print(" [*] Failed to specify the cpu architecture.")
        parent_abi = os.path.join(self.Decompile_path, self.apkname, "lib")

        if self.arch not in os.listdir(parent_abi):
            print(" [!][!] The specified cpu architecture does not exist.")
            raise ToolsException(" [*] " + self.name + ": The specified cpu architecture does not exist")

    def find_arch(self):
        if not utils.judge_input(self.name):
            print(" [*] the input_apk is not exist.")
            exit(0)
        print(" [+] Find the apk architecture.")

        if not self.arch:
            self.performance_first()
        else:
            self.select_abi()
        print(" [+] determined the cpu architecture.")

        so_graph = self.generate_jni(self.apkname)
        os.system("cd lib/lib; build.sh " + self.arch)

        if any(len(v) != 0 for v in so_graph.items()):
            print(" [+] Fuzz...")
            # copy some library
            if self.arch == "arm64-v8a":
                cmd = "adb push lib/afl-fuzz/arm64-v8a/libc++_shared.so /data/local/tmp"
                print(cmd)
                os.system(cmd)
            elif self.arch == "armeabi-v7a":
                cmd = "adb push lib/afl-fuzz/armeabi-v7a/libc++_shared.so /data/local/tmp"
                print(cmd)
                os.system(cmd)
            elif self.arch == "armeabi":
                cmd = "adb push lib/afl-fuzz/armeabi/libc++_shared.so /data/local/tmp"
                print(cmd)
                os.system(cmd)
            elif self.arch == "x86":
                cmd = "adb push lib/afl-fuzz/x86/libc++_shared.so /data/local/tmp"
                print(cmd)
                os.system(cmd)
            elif self.arch == "x86_64":
                cmd = "adb push lib/afl-fuzz/x86_64/libc++_shared.so /data/local/tmp"
                print(cmd)
                os.system(cmd)
            self.Fuzz_apk(so_graph, self.gcc, self.fuzz_one)
        else:
            print(" [*] The so file can not find any jni method.")
            raise ToolsException(" [+]" + self.apkname + "\n The apk don't find the jni method.")


if __name__ == "__main__":
    # python FindAvd.py apk/Native1.apk out armeabi 90 false/true
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    arch = sys.argv[3]
    fuzz_onlyone = sys.argv[4]
    fuzz_time = sys.argv[5]
    if fuzz_onlyone == "false":
        fuzz_onlyone = False
    avd = FindAvd(apk_path, out_paths, arch, fuzz_onlyone, float(fuzz_time))
    avd.find_arch()
