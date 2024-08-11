import os
import sys
import utils

from utils import utils
from utils.run_command import rcmd1, rcmd3, rcmd4
from utils.exception import ToolsException, HaveException
from utils.generate_script_file import generate_amandroid_script, generate_flowdroid_script
from utils.deal_taint_path import deal_amandroid_taint, deal_flowdroid_taint, deal_jucify_taint, deal_jnfuzz_test

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)

platform = "~/Android/Sdk/platforms/"
taint_path_file = "~/.amandroid_stash/amandroid/taintAnalysis/sourceAndSinks/TaintSourcesAndSinks.txt"


class ContinueProcess:
    def __init__(self, name, out_path, times, remove):
        self.apkname = utils.get_apkname(name)
        self.apkPath = name
        self.out_path = out_path
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"

        self.dynamic_methods = out_path + "/Dmethods"
        # for Amandroid
        self.Data_path = out_path + "/Data"
        self.IDDGs_path = out_path + "/IDDGs"
        # for flowdroid
        self.flowdroid_engine = out_path + "/flowdroid_engine"
        # for jucify
        self.jucify_engine = out_path + "/jucify_engine"

        self.taint_path = out_path + "/taint_path"

        self.Script_path = out_path + "/scripts"

        self.taint_info = {}

        self.exec_time = times
        self.remove_flag = remove

    def get_dynamic_methods(self):
        if not os.path.exists(self.apkPath):
            log.error("[!] the input_apk is not exist.")
            exit(0)

        utils.create_floder(self.dynamic_methods)
        apk_dynamic_path = os.path.join(self.dynamic_methods, self.apkname + "_Dmethods")

        if not os.path.exists(apk_dynamic_path):
            abs_path = os.path.abspath(self.apkPath)
            cmd = "python lib/JuCify/nativediscloser/get_dynamic_methods.py " + abs_path + \
                  " --out " + self.dynamic_methods
            rcmd3(cmd, 30 * 60)

            log.info("[+] using Angr to get the dynamic methods.")
            if not os.path.exists(apk_dynamic_path):
                log.error("[!] the command `workon jucify_py38` may not be used.")
                raise HaveException("[!] the command `workon jucify_py38` may not be used.")

            if len(os.listdir(apk_dynamic_path)) == 0:
                log.warning(f"[*] the {self.apkname} does not have dynamic library file.")
            else:
                log.info(f"[+] the {self.apkname} have {len(os.listdir(apk_dynamic_path))} dynamic library file.")
        else:
            log.warning("[*] has been using Angr to get the dynamic methods.")

        # initialize the script directory
        # utils.remove_dir(self.Script_path)

    def taint_amandroid(self):
        log.info("[+] using the Amandroid engine to analysis.")
        utils.create_floder(self.IDDGs_path)

        if not os.path.exists(os.path.join(self.Data_path, self.apkname)):
            origin_path = os.path.abspath("lib/amandroid_taint.txt")
            tmp_path = os.path.abspath("lib/tmp_amandroid_taint.txt")

            if not os.path.exists(origin_path):
                raise HaveException(f"[!] the file {origin_path} is not exists.")

            log.info("[+] copy the Amandroid's TaintSourcesAndSinks.txt.")
            cmd = f"cp {origin_path} {tmp_path}"
            log.info(cmd)
            os.system(cmd)

            native_method = os.path.join(self.Report_path, self.apkname + ".txt")

            with open(native_method, "r") as f:
                line = f.readlines()[4]

                native_methods = line.replace("native_method = ", "").rstrip().split(",")

                with open(tmp_path, "a") as f1:
                    for i in native_methods:
                        f1.write(i.rsplit(" ", 2)[0] + " -> _SINK_\n")

            cmd = f"cp {tmp_path} {os.path.expanduser(taint_path_file)}"
            log.info(cmd)
            os.system(cmd)

            log.info("[+] paste the amandroid_taint.txt to Amandroid.")

            log.info("[+] perform the Amandroid for this apk.Wait a minutes...")
            cmd = "java -jar lib/argus-saf.jar t -a COMPONENT_BASED -d -f -mo DATA_LEAKAGE -o " + self.Data_path + \
                  " " + self.apkPath + " 2>&1 | tee " + os.path.join(self.IDDGs_path, f"{self.apkname}.txt")
            rcmd4(cmd, self.exec_time, self.apkPath, "Amandroid", self.out_path)
        else:
            log.warning("[*] has been processed by Amandroid engine to analysis.")

        lst = deal_amandroid_taint(self.Data_path, self.apkname)
        self.taint_info["Amandroid"] = set(lst)

        generate_amandroid_script(self, lst)

    def taint_flowdroid(self):
        log.info("[+] using the FlowDroid engine to analysis.")
        utils.create_floder(self.flowdroid_engine)

        result_xml = os.path.join(self.flowdroid_engine, self.apkname + "_leak.xml")
        if not os.path.exists(result_xml):
            origin_path = os.path.abspath("lib/flowdroid_taint.txt")
            tmp_path = os.path.abspath("lib/tmp_flowdroid_taint.txt")

            if not os.path.exists(origin_path):
                raise HaveException(f"[!] the file {origin_path} is not exists.")

            log.info("[+] copy the Flowdroid's TaintFlowdroid.txt.")
            cmd = f"cp {origin_path} {tmp_path}"
            log.info(cmd)
            os.system(cmd)

            native_method = os.path.join(self.Report_path, self.apkname + ".txt")

            with open(native_method, "r") as f:
                line = f.readlines()[4]

                native_methods = line.replace("native_method = ", "").rstrip().split(",")

                with open(tmp_path, "a") as f1:
                    for i in native_methods:
                        sink_method = utils.dalvik2java_type(i.rsplit(" ", 2)[0])
                        f1.write(sink_method + " -> _SINK_\n")

            log.info("[+] perform the FlowDroid for this apk.Wait a minutes...")

            cmd = "java -cp lib/soot-infoflow-cmd-jar-with-dependencies.jar " + \
                  "soot.jimple.infoflow.cmd.MainClass -d -a " + \
                  self.apkPath + " -p " + platform + " -s " + tmp_path + " -o " + result_xml
            rcmd4(cmd, self.exec_time, self.apkPath, "FlowDroid", self.out_path)
        else:
            log.warning("[*] using the FlowDroid has been done.")

        lst = deal_flowdroid_taint(self.flowdroid_engine, self.apkname)
        self.taint_info["Flowdroid"] = set(lst)

        generate_flowdroid_script(self, lst)

    def taint_jucify(self):
        log.info("[+] using the JuCify engine to analysis.")
        utils.create_floder(self.jucify_engine)
        app_name = utils.get_apkname(self.apkPath)

        if not os.path.exists(os.path.join(self.jucify_engine, f"{app_name}_cg_after.txt")):
            log.info("[+] perform the JuCify for this apk.Wait a minutes...")
            cmd = "cd lib/JuCify/scripts;./main.sh -f ../../../" + self.apkPath \
                  + " -p " + platform + " -t -b -e"
            rcmd4(cmd, self.exec_time, self.apkPath, "JuCify", self.out_path)

            app_path = self.apkPath[:-4]
            if os.path.exists(app_path) and os.path.isdir(app_path):
                utils.remove_dir(app_path)
                utils.remove_dir(app_path + "_result")

                if os.path.exists(app_path + "_cg_after.txt"):
                    cmd = "mv " + app_path + "_cg_after.txt " + self.jucify_engine
                    rcmd1(cmd)

                if os.path.exists(app_path + "_cg_before.txt"):
                    cmd = "mv " + app_path + "_cg_before.txt " + self.jucify_engine
                    rcmd1(cmd)
        else:
            log.warning("[*] using the JuCify has been done.\n")
        lst = deal_jucify_taint()
        self.taint_info.update(set(lst))

    def jnfuzz_test(self):
        log.info("[+] using the jnfuzz engine.")

        app_name = utils.get_apkname(self.apkPath)
        deal_jnfuzz_test(self.out_path, self.Decompile_path, app_name)

    def save_taint_path(self):
        # remove apk information
        num = sum(len(v) for v in self.taint_info.values())
        if num == 0 and self.remove_flag:
            ans = [os.path.join(self.Decompile_path, self.apkname), self.apkPath,
                   os.path.join(self.Report_path, self.apkname + ".txt"),
                   os.path.join(self.Report_path, self.apkname + ".txt"),
                   os.path.join(self.Data_path, self.apkname),
                   os.path.join(self.IDDGs_path, self.apkname + ".txt")]
            for i in ans:
                utils.remove_dir(i)

            ans = [self.Decompile_path, self.out_path, self.Report_path, self.dynamic_methods, self.Data_path,
                   self.IDDGs_path]
            for i in ans:
                if not os.listdir(i):
                    utils.remove_dir(ans)
            raise ToolsException(f"[!] the {self.apkname} does not has taint path.")

        # save the taint path
        utils.create_floder(self.taint_path)
        taint_txt = os.path.join(self.taint_path, f"{self.apkname}_taintpath.txt")
        with open(taint_txt, "w") as f:
            for key, value in self.taint_info.items():
                f.write("{}:\n{}\n\n".format(key, "\n".join(value)))

        # Remove duplicate scripts
        script_set = set()
        for i in os.listdir(os.path.join(self.Script_path, self.apkname)):
            file_path = os.path.join(self.Script_path, self.apkname, i)
            with open(file_path, "r") as f:
                script_set.add(f.read().strip())

        script_num = os.listdir(os.path.join(self.Script_path, self.apkname))
        for i in range(len(script_num)):
            file_path = os.path.join(self.Script_path, self.apkname, f"script_{i + 1}.txt")
            if i + 1 <= len(script_set):
                with open(file_path, "w") as f:
                    f.write(list(script_set)[i])
            elif os.path.exists(file_path):
                os.remove(file_path)


if __name__ == "__main__":
    # python3 Continue_process.py apk/native_leak.apk out 90 true/false
    # true is not remove information while running error
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    run_time = sys.argv[3]
    remove_flag = sys.argv[4]
    if remove_flag == "false":
        remove_flag = False
    else:
        remove_flag = True
    pre_analysis = ContinueProcess(apk_path, out_paths, float(run_time), remove_flag)
    pre_analysis.get_dynamic_methods()

    pre_analysis.taint_amandroid()
    pre_analysis.taint_flowdroid()
    # pre_analysis.taint_jucify()

    pre_analysis.save_taint_path()
