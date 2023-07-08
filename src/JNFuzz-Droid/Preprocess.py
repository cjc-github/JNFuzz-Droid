import os.path
import sys
from utils import utils
from utils.exception import ToolsException
from utils.utils import list_all_files, is_ELFfile


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
            print(" [*] the input_apk is not exist.")
            exit(0)

        out = os.path.join(self.Decompile_path, self.apkname)
        if not os.path.exists(out):
            cmd = "java -jar lib/apktool_*.jar d -f " + self.name + " -o " + out
            print(" [+] using the apktool.")
            os.system(cmd)

            decompile_path = os.path.join(self.Decompile_path, self.apkname)
            xml_path = os.path.join(decompile_path, "AndroidManifest.xml")

            if not os.path.exists(xml_path) or os.path.getsize(xml_path) == 0:
                self.remove()
                raise ToolsException(" [+] " + self.apkname + " apktool failed.")
        else:
            print(" [+] Has been processed by apktool.")

    # in the futher, we will consider the elf arch and some infomation.
    # currently, as far as we know, no tool that can distinguish armeabi and armeabi-v7a
    def result(self):
        deco_path = os.path.join(self.Decompile_path, self.apkname)
        lib_floder = os.path.join(deco_path, "lib")
        if not os.path.exists(lib_floder):
            os.mkdir(lib_floder)
        if os.path.exists(os.path.join(lib_floder, "arm64-v8a")):
            res = "/lib/arm64-v8a"
        else:
            if os.path.exists(os.path.join(lib_floder, "armeabi-v7a")):
                res = "/lib/armeabi-v7a"
            else:
                if not os.path.exists(os.path.join(lib_floder, "armeabi")):
                    os.mkdir(os.path.join(lib_floder, "armeabi"))
                res = "/lib/armeabi"

        if os.path.exists(deco_path):
            assets = os.path.join(deco_path, "assets")
            if os.path.exists(assets):
                file_lists = list_all_files(assets)
                for file in file_lists:
                    name = file.split("/")[-1]
                    if is_ELFfile(file):
                        os.system("cp " + file + " " + deco_path + res + "/")
                        if not name.endswith(".so"):
                            lst = name.rsplit(".", 1)[0] + ".so"
                            os.system("cp " + file + " " + deco_path + res + "/" + lst)
                        if not name.startswith("lib"):
                            cmd = "cp " + file + " " + deco_path + res + "/lib" + name
                            os.system(cmd)

                    if name.endswith(".zip"):
                        try:
                            cmd = "unzip -o -P 123456 -q " + file + " -d " + file[:-4] + "-zip"
                            os.system(cmd)
                            zip_files = list_all_files(file[:-4] + "-zip")
                            for zipfile in zip_files:
                                if is_ELFfile(zipfile):
                                    cmd = "cp " + zipfile + " " + deco_path + res
                                    os.system(cmd)
                        except Exception as e:
                            print("unzip failed.")

            abi = os.path.join(lib_floder, "armeabi")
            if os.path.exists(abi) and len(os.listdir(abi)) == 0:
                os.rmdir(os.path.join(lib_floder, "armeabi"))
            if len(os.listdir(lib_floder)) == 0:
                os.rmdir(lib_floder)
        print(" [+] finish extract additional ELF files from the assets folder.")

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
        print(" [+] analysis the " + self.name)

        so_files = utils.get_so_files(self.Decompile_path, self.apkname)
        native_activities = utils.get_native_activity(self.Decompile_path, self.apkname)
        native_method = utils.get_native_methods(self.Decompile_path, self.apkname)

        if not os.path.exists(apk_report):
            os.mknod(apk_report)
            with open(apk_report, "a") as f:
                f.write("[apk]\n")
                f.write("name = " + self.name + "\n")
                f.write("so_files = " + so_files + "\n")
                f.write("native_activities = " + native_activities + "\n")
                f.write("native_method = " + native_method + "\n")
            f.close()
        else:
            print(" [+] Collect the infomations from apktool.\n")

        if len(native_method) == 0:
            if self.remove_flag:
                self.remove()
            print(" [+] " + self.apkname + " smali code not find the native function.")
            raise ToolsException(" [+] " + self.name + " samli code not find the native function.")
            # try:
            #     # [maye be pure native apk or no native]
            #     raise ToolsException(" [+] " + self.name + " samli code not find the native function.")
            # except:
            #     print(" [!] Subfile execution fialed to throw an exception.")


if __name__ == "__main__":
    # python3 Preprocess.py apk/native1.apk out true/false
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    remove_flag = sys.argv[3]
    if remove_flag == "false":
        remove_flag = False
    pre_deal = Preprocess(apk_path, out_paths, remove_flag)
    pre_deal.apktool()
    pre_deal.result()
    pre_deal.report()
