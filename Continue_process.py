import copy
import os
import re
import sys

import utils
import time
import signal
import subprocess
import psutil

from utils import utils, deal_taint_path
from datetime import datetime

from utils.exception import ToolsException, HaveException

platform = "/home/cao/Android/Sdk/platforms/"
taint_path_file = "~/.amandroid_stash/amandroid/taintAnalysis/sourceAndSinks/TaintSourcesAndSinks.txt"


def run_command(cmd, timeout=60 * 90):
    p = subprocess.Popen(cmd, stderr=subprocess.STDOUT, stdout=subprocess.PIPE, shell=True, preexec_fn=os.setsid)
    t_beginning = time.time()
    seconds_passed = 0
    while True:
        if p.poll() is not None:
            break
        seconds_passed = time.time() - t_beginning
        if timeout and seconds_passed > timeout:
            if psutil.pid_exists(p.pid):
                try:
                    os.killpg(p.pid, signal.SIGTERM)
                except:
                    raise TimeoutError(cmd, timeout)
        time.sleep(0.1)
    return p.stdout.read()


def delete1(i, tmp_lists):
    flag = 0
    for j in tmp_lists:
        if i[1] == j[1] and i[2] == j[2]:
            flag = 1
    if flag == 1:
        return False
    return True


def some_sink(i, j):
    sink1 = i.split(" ===> ")[-1].split(" ")[0]
    sink2 = j.split(" ===> ")[-1].split(" ")[0]
    if i != j and sink1 == sink2:
        return True
    else:
        return False

def clone_list(tmp_list):
    # tmp_list_copy=tmp_list[:]
    tmp_list_copy = copy.deepcopy(tmp_list)
    return tmp_list_copy


def get_jni_methods(report_path, name):
    methods = []
    path = os.path.join(report_path, name + ".txt")
    if os.path.exists(path):
        with open(path, "r") as f:
            lines = f.readlines()
            methods = lines[-1].replace("native_method = ", "").replace("\n", "") \
                .replace(" 0", "").replace(" 1", "").split(",")
    else:
        print(" [!] cann't’ find the report file.")
    return methods


def judge_nodeal(taint_txt):
    with open(taint_txt, "r") as f:
        lines = f.readlines()
        if len(lines) > 0 and "    TaintPath:" in lines[0]:
            return True
        else:
            return False
    return False


def deal_taint(data_path, report_path, apk_name):
    print(" [+] get the concreate taint path.")
    taint_txt = os.path.join(data_path, apk_name, "result", "Taint.txt")
    lists = []
    if os.path.exists(taint_txt) and judge_nodeal(taint_txt):
        with open(taint_txt, "r") as f:
            lines = f.readlines()
            for i in range(int(len(lines) / 6)):
                tmp = []
                for j in lines[6 * i:6 * i + 6]:
                    tmp.append(j)
                lists.append(tmp)
        f.close()
        jni_methods = get_jni_methods(report_path, apk_name)

        taint_path = []
        for i in lists:
            # eg. api_source
            str1 = i[1].split("_source: ")[1].split(">")[0]
            path_list = re.split(r",(?![^(]*\))", i[5][13:-1])
            for n in path_list:
                for met in jni_methods:
                    if met.strip() in n and "param:" in n:
                        str1 = str1 + " ===> " + met.strip() + " "
                        if n.split("param: ")[1][-1] == ")":
                            str1 = str1 + n.split("param: ")[1][:-1]
                        else:
                            str1 = str1 + n.split("param: ")[1]
            taint_path.append(str1 + "\n")
        utils.write_to_file(taint_path, taint_txt)
    else:
        print(" [+] the taint path has been done.")


class ContinueProcess:
    def __init__(self, name, out_path, times):
        self.apkname = utils.get_apkname(name)
        self.apkPath = name
        self.out_path = out_path
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"
        self.Data_path = out_path + "/Data"
        self.IDDGs_path = out_path + "/IDDGs"
        self.jucify_engine = out_path + "/jucify_engine"
        self.flowdroid_engine = out_path + "/flowdroid_engine"
        self.dynamic_methods = out_path + "/Dmethods"
        self.exec_time = times
    def get_dynamic_methods(self):
        utils.create_floder(self.dynamic_methods)
        if not os.path.exists(os.path.join(self.dynamic_methods, self.apkname + "_Dmethods")):
            abs_path = os.path.abspath(self.apkPath)
            cmd = "cd lib/JuCify/nativediscloser/; python get_dynamic_methods.py " + abs_path + \
                  " --out ../../../" + self.dynamic_methods
            print(cmd)
            os.system(cmd)
        else:
            print(" [+] 2.0 has been processed by Angr to get the dynamic methods.\n")

    def custom_sink(self, name):
        utils.create_floder(self.IDDGs_path)
        if not os.path.exists(os.path.join(self.Data_path, name)):
            cmd = "cp lib/amandroid_taint.txt lib/TaintSourcesAndSinks.txt"
            print("  [-] copy the amandroid_taint.txt.")
            os.system(cmd)

            Native_method = os.path.join(self.Report_path, name + ".txt")
            with open(Native_method, "r") as f:
                lines = f.readlines()
                line = lines[4]
                native_methods = line.replace("native_method = ", "").rstrip().split(",")
                with open("lib/TaintSourcesAndSinks.txt", "a") as f1:
                    for i in native_methods:
                        f1.write(i.rsplit(" ", 2)[0] + " -> _SINK_\n")
                cmd = "cp lib/TaintSourcesAndSinks.txt " + taint_path_file
                print("  [-] paste the amandroid_taint.txt to jn-saf.")
                os.system(cmd)
            f.close()

            nowTime = datetime.now()
            print("start", nowTime)
            cmd = "java -jar lib/argus-saf.jar t -a COMPONENT_BASED -d -f -mo DATA_LEAKAGE -o " + \
                  self.Data_path + " " + self.apkPath + " >> " + self.IDDGs_path + "/" + name + ".txt"
            # cmd = "java -jar lib/argus-saf.jar t -a COMPONENT_BASED -d -f -mo DATA_LEAKAGE -o " + \
            #       self.Data_path + " " + self.apkPath + " -i ~/.amandroid_stash/amandroid/test_config.ini >> " \
            #       + self.IDDGs_path + "/" + name + ".txt"
            print(cmd)
            print("  [-] perform the jnsaf for this apk.Wait a minutes...")
            # os.system(cmd)

            try:
                run_command(cmd, self.exec_time)
                print(" [+] finish the Amandroid analysis")
            except TimeoutError:
                print(" [!] execute Amandroid timeout after %i" % self.exec_time)
                utils.save_static_time(self.out_path, " Amandroid timeout!")
                raise ToolsException(self.apkPath + " timeout")
            else:
                print(" [*] no timeout!")

            # os.system(cmd)
            lastTime = datetime.now()
            print("end:", lastTime)
            print("using time", lastTime - nowTime)
            utils.save_static_time(self.out_path, " Amandroid: " + str(lastTime - nowTime))
            deal_taint_path.deal_Amandroid_taint(self.Data_path, self.apkname)
        else:
            print(" [+] 2.1 has been processed by jn-saf.\n")
        # deal_taint_path.deal_Amandroid_taint(self.Data_path, self.apkname)

    def taint(self):
        print(" [+] 2.1 using the Amandroid engine")
        if not utils.judge_input(self.apkPath):
            print(" [*] the input_apk is not exist.")
            exit(0)

        # add apk name
        utils.save_static_time(self.out_path, self.apkname)
        self.custom_sink(self.apkname)
        # time.sleep(3)

    def taint_jucify(self):
        print(" [+] 2.2 using the JuCify engine.")
        if not utils.judge_input(self.apkPath):
            print(" [*] the input_apk is not exist.")
            exit(0)

        utils.create_floder(self.jucify_engine)
        app_name = utils.get_apkname(self.apkPath)
        if not os.path.exists(self.jucify_engine + "/" + app_name + "_cg_after.txt"):
            nowTime = datetime.now()
            print("start:", nowTime)
            cmd = "cd lib/JuCify/scripts;./main.sh -f ../../../" + self.apkPath \
                  + " -p " + platform + " -t -b -e"
            print(cmd)

            try:
                run_command(cmd, self.exec_time)
                print(" [+] Finish the Jucify analysis")
            except TimeoutError:
                print("execute Jucify timeout after %i" % self.exec_time)
                utils.save_static_time(self.out_path, " JuCify timeout!")
                # raise ToolsException(self.apkPath + " timeout")
            else:
                print(" [+] no timeout!")

            # os.system(cmd)
            lastTime = datetime.now()
            print("end:", lastTime)
            print("using time", lastTime - nowTime)
            utils.save_static_time(self.out_path, " JuCify:" + str(lastTime - nowTime))

            if os.path.exists(self.apkPath[:-4]) and os.path.isdir(self.apkPath[:-4]):
                utils.remove_dir(self.apkPath[:-4])
                utils.remove_dir(self.apkPath[:-4] + "_result")
                if os.path.exists(self.apkPath[:-4] + "_cg_after.txt"):
                    cmd = "mv " + self.apkPath[:-4] + "_cg_after.txt " + self.jucify_engine
                    os.system(cmd)
                if os.path.exists(self.apkPath[:-4] + "_cg_before.txt"):
                    cmd = "mv " + self.apkPath[:-4] + "_cg_before.txt " + self.jucify_engine
                    os.system(cmd)
            deal_taint_path.deal_jucify_taint()
        else:
            print(" [+] 2.2 using the JuCify has been done.\n")

    def taint_flowdroid(self):
        print(" [+] using the FlowDroid engine.")
        if not utils.judge_input(self.apkPath):
            print(" [*] the input_apk is not exist.")
            exit(0)

        utils.create_floder(self.flowdroid_engine)
        app_name = utils.get_apkname(self.apkPath)
        if not os.path.exists(self.flowdroid_engine + os.sep + app_name + "_leak.xml"):
            cmd = "cp lib/flowdroid_taint.txt lib/TaintFlowdroid.txt"
            print("  [-] copy the Flowdroid_taint.txt.")
            os.system(cmd)

            Native_method = os.path.join(self.Report_path, app_name + ".txt")
            with open(Native_method, "r") as f:
                lines = f.readlines()
                line = lines[4]
                native_methods = line.replace("native_method = ", "").rstrip().split(",")
                with open("lib/TaintFlowdroid.txt", "a") as f1:
                    for i in native_methods:
                        sink_method = utils.changeAmdtoFlow(i.rsplit(" ", 2)[0])
                        f1.write(sink_method + " -> _SINK_\n")
            f.close()
            nowTime = datetime.now()
            print("start:", nowTime)
            cmd = "java -cp lib/soot-infoflow-cmd-jar-with-dependencies.jar soot.jimple.infoflow.cmd.MainClass -d -a " + \
                  self.apkPath + " -p " + platform + " -s lib/TaintFlowdroid.txt -o " \
                  + self.flowdroid_engine + os.sep + app_name + "_leak.xml"
            print(cmd)
            # os.system(cmd)

            try:
                run_command(cmd, self.exec_time)
                print(" [+] Finish.")
            except TimeoutError:
                print("execute FlowDroid timeout after %i" % self.exec_time)
                os.system("cp lib/empty.xml " + self.flowdroid_engine + os.sep + app_name + "_leak.xml")
                utils.save_static_time(self.out_path, " FlowDroid timeout!")
                raise ToolsException(self.apkPath + " timeout")
            else:
                print(" [+] no timeout!")

            # os.system(cmd)
            lastTime = datetime.now()
            print("end:", lastTime)
            print("using time", lastTime - nowTime)
            utils.save_static_time(self.out_path, " FlowDroid: " + str(lastTime - nowTime))
            deal_taint_path.deal_flowdroid_taint(self.flowdroid_engine, app_name)
        else:
            print(" [+] using the flowdroid has been done.\n")

    # jnfuzz test
    def jnfuzz_test(self):
        print(" [+] using the jnfuzz engine.")
        if not utils.judge_input(self.apkPath):
            print(" [*] the input_apk is not exist.")
            exit(0)

        app_name = utils.get_apkname(self.apkPath)
        deal_taint_path.deal_jnfuzz_test(self.out_path, self.Decompile_path, app_name)

    def appdata(self, flag_remove):
        taint_txt = os.path.join(self.Data_path, self.apkname, "result", "Taint.txt")
        # utils.displaytxt(taint_txt)

        if not os.path.exists(taint_txt) or os.path.getsize(taint_txt) == 0:

            print(" [*] " + self.apkname + " delete the not ineligible apk and some informations.")
            if flag_remove:
                ans = [os.path.join(self.Decompile_path, self.apkname), self.apkPath,
                       os.path.join(self.IDDGs_path, self.apkname + ".txt"),
                       os.path.join(self.Data_path, self.apkname),
                       os.path.join(self.Report_path, self.apkname + ".txt"),
                       os.path.join(self.dynamic_methods, self.apkname + "_Dmethods"), taint_txt]
                for i in ans:
                    utils.remove_dir(i)
                ans = [self.Decompile_path, self.out_path, self.Report_path, self.dynamic_methods, self.Data_path,
                       self.IDDGs_path]
                for i in ans:
                    if not os.listdir(i):
                        utils.remove_dir(ans)
            raise HaveException("")
        else:
            print(" [+] exist the taint path.")
        deal_taint(self.Data_path, self.Report_path, self.apkname)


if __name__ == "__main__":
    # apk_path = "apk/Native1.apk"
    # out_paths = "out"
    # python Preprocess.py apk/Native1.apk out
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    pre_analysis = ContinueProcess(apk_path, out_paths, 90)
    pre_analysis.get_dynamic_methods()
    pre_analysis.taint()
    # pre_analysis.taint_jucify()
    # pre_analysis.taint_flowdroid()
    pre_analysis.appdata(False)
