import os
import sys

from utils import utils
from utils.utils import list_all_files
from utils.exception import ToolsException
from utils.file_analysis import if_elf_file
from utils.extra_apktool import get_so_files, get_native_activity, get_native_methods
from utils.run_command import rcmd1, rcmd2

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


class Preprocess:
    def __init__(self, name, out_path, remove):
        self.apkname = utils.get_apkname(name)
        self.name = name
        self.out_path = out_path
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"
        self.remove_flag = remove

    def apktool(self):
        if not utils.judge_input(self.name):
            log.error("[!] the input_apk is not exist.")
            sys.exit(0)

        out = os.path.join(self.Decompile_path, self.apkname)
        path = "lib/apktool_2.6.1.jar"
        if not os.path.exists(path):
            log.error("[!] apktool.jar is not exists.")
            raise ValueError("[!] apktool.jar is not exists.")

        if not os.path.exists(out):
            os.makedirs(out)
            cmd = "java -jar " + os.path.abspath(path) + " d -f " + os.path.abspath(
                self.name) + " -o " + os.path.abspath(out)
            log.info("[+] using the apktool to decompile the apk.")

            rcmd2(cmd)

            xml_path = os.path.join(self.Decompile_path, self.apkname, "AndroidManifest.xml")
            if not os.path.exists(xml_path) or os.path.getsize(xml_path) == 0:
                self.remove()
                raise ToolsException(f"[!] {self.apkname} apktool failed.")
        else:
            log.warning("[*] has been processed by apktool.")

    # in the futher, we will consider the elf arch and some infomation.
    # currently, as far as we know, no tool that can distinguish armeabi and armeabi-v7a
    def result(self):
        log.info("[+] extract additional ELF files from the assets folder.")
        deco_path = os.path.join(self.Decompile_path, self.apkname)
        lib_folder = os.path.join(deco_path, "lib")
        if not os.path.exists(lib_folder):
            os.mkdir(lib_folder)

        if os.path.exists(os.path.join(lib_folder, "arm64-v8a")):
            res = "/lib/arm64-v8a"
        elif os.path.exists(os.path.join(lib_folder, "armeabi-v7a")):
            res = "/lib/armeabi-v7a"
        elif os.path.exists(os.path.join(lib_folder, "armeabi")):
            res = "/lib/armeabi"
        else:
            os.mkdir(os.path.join(lib_folder, "armeabi"))
            res = "/lib/armeabi"

        # cp elf file in assets to armeabi/armeabi-v8a/arm64-v8a library
        if os.path.exists(deco_path):
            assets = os.path.join(deco_path, "assets")
            if os.path.exists(assets):
                file_lists = list_all_files(assets)
                for file in file_lists:
                    name = file.split("/")[-1]
                    # list file in assets folders
                    if if_elf_file(file):
                        cmd = "cp " + file + " " + deco_path + res + "/"
                        rcmd1(cmd)

                        # add suffix .so
                        if not name.endswith(".so"):
                            lst = name.rsplit(".", 1)[0] + ".so"
                            cmd = "cp " + file + " " + deco_path + res + "/" + lst
                            rcmd1(cmd)

                        # add prefix lib
                        if not name.startswith("lib"):
                            cmd = "cp " + file + " " + deco_path + res + "/lib" + name
                            rcmd1(cmd)

                    # process .zip compressed files
                    if name.endswith(".zip"):
                        try:
                            cmd = "unzip -o -P 123456 -q " + file + " -d " + file[:-4] + "-zip"
                            rcmd1(cmd)

                            zip_files = list_all_files(file[:-4] + "-zip")
                            for zipfile in zip_files:
                                if if_elf_file(zipfile):
                                    cmd = "cp " + zipfile + " " + deco_path + res
                                    rcmd1(cmd)
                        except Exception as e:
                            log.error(f"unzip failed. {e}.")

            # if armeabi is empty, then remove this folder
            abi = os.path.join(lib_folder, "armeabi")
            if os.path.exists(abi) and len(os.listdir(abi)) == 0:
                os.rmdir(os.path.join(lib_folder, "armeabi"))

            if len(os.listdir(lib_folder)) == 0:
                os.rmdir(lib_folder)

        log.info("[+] finish extract additional ELF files from the assets folder.")

    def remove(self):
        ans = [os.path.join(self.Decompile_path, self.apkname), self.name,
               os.path.join(self.Report_path, self.apkname + ".txt")]
        for i in ans:
            utils.remove_dir(i)
        ans = [self.Decompile_path, self.Report_path, self.out_path]
        for i in ans:
            if not os.listdir(i):
                utils.remove_dir(i)

    def report(self):
        utils.create_floder(self.Report_path)
        apk_report = os.path.join(self.Report_path, self.apkname + ".txt")
        log.info(f"[+] analysis the {self.name}.")

        so_files = get_so_files(self.Decompile_path, self.apkname)
        native_activities = get_native_activity(self.Decompile_path, self.apkname)
        native_method = get_native_methods(self.Decompile_path, self.apkname)

        if not os.path.exists(apk_report):
            os.mknod(apk_report)
            with open(apk_report, "a") as f:
                f.write("[apk]\n")
                f.write("name = " + self.name + "\n")
                f.write("so_files = " + so_files + "\n")
                f.write("native_activities = " + native_activities + "\n")
                f.write("native_method = " + native_method + "\n")
        else:
            log.warning("[*] collect the information from apktool tool.")

        if len(native_method) == 0:
            if self.remove_flag:
                self.remove()
            log.info(f"[+] {self.apkname} smali code not find the native function.")
            raise ToolsException(f"[!] {self.name}'s smali code not find the native function.")

        log.info("[+] decompile the apk and extract elf file.\n")


if __name__ == "__main__":
    # python3 Preprocess.py apk/native_leak.apk out true/false
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    remove_flag = sys.argv[3]
    if remove_flag == "false":
        remove_flag = False
    else:
        remove_flag = True
    pre_deal = Preprocess(apk_path, out_paths, remove_flag)
    pre_deal.apktool()
    pre_deal.result()
    pre_deal.report()
