import os
import signal
import subprocess
import sys
import time

from utils import utils, dynamic_methods
from utils.generate_hook_script import generate_hook_script
from utils.exception import ToolsException, HaveException
from utils.generate_server_cpp import generate_server_cpp, getClass_Method
from utils.generate_server_c import generate_server_x86
from utils.run_command import rcmd1

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)

gcc_paths = {
    "arm64-v8a": "~/Android/Sdk/ndk/android-standalone-toolchain-arm64/bin/aarch64-linux-android-g++",
    "armeabi-v7a": "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++",
    "armeabi": "~/Android/Sdk/ndk/android-standalone-toolchain-arm/bin/arm-linux-androideabi-g++",
    "x86_64": "~/Android/Sdk/ndk/android-standalone-toolchain-x86_64/bin/x86_64-linux-android-gcc",
    "x86": "~/Android/Sdk/ndk/android-standalone-toolchain-x86/bin/i686-linux-android-gcc"
}


def get_method(apk_scripts, file):
    file_path = os.path.join(apk_scripts, file)
    with open(file_path, "r") as f:
        lines = f.readlines()

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


def generate_cient_and_server(file_path, gcc):
    log.info("[+] generate the client and server.")
    cmd = "adb shell su -c 'cd /data/local/tmp;rm -rf client server'"
    rcmd1(cmd)

    cmd = "cd lib/examples/;" + gcc + " -o client client.c ../lib/spsc.c " + \
          "-I ../lib -lspsc -L ../lib -Wall -O3 -w"
    rcmd1(cmd)

    if "x86" in gcc:
        out_path = file_path.replace("scripts", "outcome").replace("script_", "server").replace(".txt", ".c")
        cmd = "cp " + out_path + " ./lib/examples/server.c"
        rcmd1(cmd)

        cmd = "cd lib/examples/;" + gcc + " -o server server.c ../lib/spsc.c " + \
              "../lib/vm.c -I ../lib -lspsc -L ../lib -Wall -O3 -ldl -Wl,--export-dynamic -w"
        rcmd1(cmd)
    elif "arm" in gcc:
        out_path = file_path.replace("scripts", "outcome").replace("script_", "server").replace(".txt", ".cpp")
        cmd = "cp " + out_path + " ./lib/examples/server.cpp"
        rcmd1(cmd)

        cmd = "cd lib/examples/;" + gcc + " -std=c++17 -o server server.cpp ../lib/spsc.c " + \
              "-I ../lib -lspsc -L ../lib -Wall -O3 -ldl -Wl,--export-dynamic,-rpath=/data/local/tmp -w -lc++_shared"
        rcmd1(cmd)

    if not os.path.exists("lib/examples/server"):
        return

    cmd = "adb push lib/examples/client /data/local/tmp"
    rcmd1(cmd)
    cmd = "adb push lib/examples/server /data/local/tmp"
    rcmd1(cmd)


def generate_fuzzing_seed(totalsize):
    log.info("[+] generate the fuzzing seed.")
    if totalsize != 0:
        seed = "0" * totalsize
    else:
        seed = "0000"
    cmd = "adb shell 'cd /data/local/tmp;mkdir in;echo \"" + seed + "\" > in/1\'"
    rcmd1(cmd)


def launch_fuzzing(file_path, fuzz_one, fuzz_time):
    log.info("[+] launch the fuzzing and taint analysis.")
    cmd1 = 'gnome-terminal -t frida-server -- bash -c "adb shell < utils_cmd/start-frida-server.txt;exec bash"'

    cmd2 = 'gnome-terminal -t Hook -- bash -c "python3 utils/run_hook_script.py ' + file_path + ';exec bash"'
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


def stop_fuzzing():
    log.info("[+] stop the fuzzing and taint analysis.")
    cmd = "adb shell < utils_cmd/remove-exec.txt"
    rcmd1(cmd)


def fuzzing_and_taintanalysis(file_path, gcc, totalsize, fuzz_one, fuzz_time):
    generate_cient_and_server(file_path, gcc)
    generate_fuzzing_seed(totalsize)
    launch_fuzzing(file_path, fuzz_one, fuzz_time)
    stop_fuzzing()
    log.info("[+] kill the afl ,frida pid and ash memory.")


def judge_repeat_so(folder):
    if not os.path.exists(folder):
        return True

    abi_dirs = ["arm64-v8a", "armeabi-v7a", "armeabi"]
    file_lists = []
    for abi_dir in abi_dirs:
        abi_path = os.path.join(folder, abi_dir)
        if os.path.exists(abi_path) and os.path.isdir(abi_path):
            file_lists.append(os.listdir(abi_path))

    if len(file_lists) == 1:
        return True
    elif len(file_lists) == 2:
        return sorted(file_lists[0]) == sorted(file_lists[1])
    else:
        # return len(set(map(sorted, file_lists))) == 14
        return sorted(file_lists[0]) == sorted(file_lists[1]) == sorted(file_lists[2])


class Fuzz_and_taint_analysis:
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
        self.lib_path = os.path.join(self.Decompile_path, self.apkname, "lib")

    def copy_sofile(self):
        if judge_repeat_so(self.lib_path):
            so_path = os.path.join(self.lib_path, self.arch)
            cmd = "adb push " + so_path + "/* /data/local/tmp"
            rcmd1(cmd)
        else:
            log.warning("[*] the apk exists the difficult so file in different abi.")
            if os.path.exists(os.path.join(self.lib_path, "arm64-v8a")):
                cmd = "adb push " + self.lib_path + "/arm64-v8a/* /data/local/tmp"
                rcmd1(cmd)
            if os.path.exists(os.path.join(self.lib_path, "armeabi-v7a")):
                cmd = "adb push " + self.lib_path + "/armeabi-v7a/* /data/local/tmp"
                rcmd1(cmd)
            if os.path.exists(os.path.join(self.lib_path, "armeabi")):
                cmd = "adb push " + self.lib_path + "/armeabi/* /data/local/tmp"
                rcmd1(cmd)

    def add_other_arch(self, name):
        list1 = ["x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a"]
        res = []
        for i in list1:
            so_files = os.path.join(self.lib_path, i)
            if os.path.isdir(so_files):
                res.append(so_files)
        return res

    def fuzz_apk_jni(self, so_graph, gcc, fuzz_one):
        jn_apk = utils.deal_apk(self.name)
        cmd = "adb push " + jn_apk + " /data/local/tmp"
        rcmd1(cmd)
        cmd = "adb push " + jn_apk + " /data/local/tmp/target-app.apk"
        rcmd1(cmd)

        apk_scripts = os.path.join(self.Script_path, self.apkname)
        self.copy_sofile()

        if os.path.exists(apk_scripts):
            for i in os.listdir(apk_scripts):
                # if i == "script_4.txt":
                if True:
                    log.info(f"[+] running the {self.name} script {i}")
                    file_path = os.path.join(apk_scripts, i)
                    java_method = get_method(apk_scripts, i)
                    so_file = get_solist(java_method, so_graph)
                    dirs = os.path.join(self.out_path, "Dmethods", f"{self.apkname}_Dmethods")

                    try:
                        target_native_name = getClass_Method(java_method, dirs, so_graph.get(so_file))
                        # dynamic register or other
                        totalsize = 0
                        if self.arch in ["arm64-v8a", "armeabi-v7a", "armeabi"]:
                            totalsize = generate_server_cpp(self.out_path, self.apkname, java_method,
                                                            target_native_name, so_file, file_path, self.size)
                        elif self.arch in ["x86", "x86_64"]:
                            totalsize = generate_server_x86(self.out_path, self.apkname, java_method,
                                                            target_native_name, so_file, file_path, self.size)
                        generate_hook_script(target_native_name, so_file, file_path)
                        fuzzing_and_taintanalysis(file_path, gcc, totalsize, fuzz_one, self.fuzz_time)
                    except Exception as e:
                        line = file_path + " generate the server.c failed."
                        utils.save_file(self.out_path, line)
                        log.error("[!] generate the server.c failed.")

            cmd = "adb shell 'cd /data/local/tmp;su -c rm -rf lib* test_jni* *.apk out in *.so target-app.apk'"
            rcmd1(cmd)

        log.info("[+] Finish the Fuzz.")

    # if the naitve method is static register,
    # for example {libantive-so,[Java_org_cao_atoll_send]}
    # if the native method is dynamic register,
    # for example {libegamepay,[Lcn/egame/terminal/paysdk/jni/EgamePayProtocol;.init:(Landroid/content/Context;)Lcn/egame/terminal/paysdk/jni/ProtocolMessage;]}
    def collect_jni_function(self, name):
        so_graphs = dict()
        so_files = os.path.join(self.lib_path, self.arch)

        # If so files are different in different architecture, add different architecture
        if not judge_repeat_so(self.lib_path):
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
                log.error("[!] arch not exist! error!")

        # dynamic register
        folder = os.path.join(self.dynamic_methods, f"{self.apkname}_Dmethods")
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
        so_files = []
        for abi in os.listdir(self.lib_path):
            so_files.append(abi)

        for arch in gcc_paths:
            if arch in so_files:
                self.gcc = gcc_paths[arch]
                self.arch = arch
                break
        else:
            log.error("[!] The apk don't have the arm or x86 arch.")
            raise ToolsException(f"[+] {self.apkname}: the apk don't have the arm or x86 arch.")

        if not os.path.exists(os.path.expanduser(self.gcc)):
            raise HaveException("[!] the standalone toolchain is not exists.")

    def select_abi(self):
        if self.arch in gcc_paths:
            self.gcc = gcc_paths[self.arch]
        else:
            log.error("[!] Failed to specify the cpu architecture.")

        if self.arch not in os.listdir(self.lib_path):
            log.error(f"[!] The specified cpu architecture {self.gcc} does not exist in apk.")
            raise ToolsException(f"[!] {self.name}: the specified cpu architecture {self.gcc} does not exist in apk.")

    def select_arch(self):
        if not os.path.exists(self.name):
            log.error("[!] the input_apk is not exist.")
            exit(0)

        log.info("[+] select the apk cpu architecture.")
        if not self.arch:
            self.performance_first()
        else:
            self.select_abi()
        log.info("[+] determined the apk cpu architecture.")

        cmd = "cd lib/lib; build.sh " + self.arch
        rcmd1(cmd)

    def fuzz_jni(self):
        so_graph = self.collect_jni_function(self.apkname)
        if any(len(v) != 0 for v in so_graph.items()):
            log.info("[+] Start Fuzz ...")

            cmd = f"adb push lib/afl-fuzz/{self.arch}/libc++_shared.so /data/local/tmp"
            rcmd1(cmd)

            self.fuzz_apk_jni(so_graph, self.gcc, self.fuzz_one)
        else:
            log.error("[!] The so file can not find any jni method.")
            raise ToolsException(f"[+] {self.apkname}: the apk don't find the jni method.")


if __name__ == "__main__":
    # python Fuzz_and_taint_analysis.py apk/native_leak.apk out armeabi false/true 90
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    arch = sys.argv[3]
    fuzz_only_one = sys.argv[4]
    fuzz_time = sys.argv[5]
    if fuzz_only_one == "false":
        fuzz_only_one = False
    else:
        fuzz_only_one = True
    fuzz = Fuzz_and_taint_analysis(apk_path, out_paths, arch, fuzz_only_one, float(fuzz_time))
    fuzz.select_arch()
    fuzz.fuzz_jni()
