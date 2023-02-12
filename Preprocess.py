import os.path
import sys
from utils import utils
from utils.exception import ToolsException
from utils.utils import list_all_files, is_ELFfile


class Preprocess:

    def __init__(self, name, out_path):
        self.apkname = utils.get_apkname(name)
        self.name = name
        self.out_path = out_path
        self.Decompile_path = out_path + "/decompile"
        self.Report_path = out_path + "/report"

    # using apktool to decompile the apk
    def apktool(self, flag_remove):
        if not utils.judge_input(self.name):
            print(" [*] the input_apk is not exist.")
            exit(0)

        out = os.path.join(self.Decompile_path, self.apkname)
        if not os.path.exists(out):
            cmd = "java -jar lib/apktool_2.6*.jar d -f " + self.name + " -o " + out
            print(" [+] 1. using the apktools.")
            os.system(cmd)

            # apktool failed
            decompile_path = os.path.join(self.Decompile_path, self.apkname)
            xml_path = os.path.join(decompile_path, "AndroidManifest.xml")

            # decompile failed => AndroidManifest.xml文件
            if not os.path.exists(xml_path) or os.path.getsize(xml_path) == 0:
                self.remove()
                raise ToolsException(" [+] " + self.apkname + " apktool failed.")
        else:
            print(" [+] Has been preocessed by apktool.")

    def result(self):
        deco_path = os.path.join(self.Decompile_path, self.apkname)
        # create the lib folder
        lib_floder = os.path.join(deco_path, "lib")
        if not os.path.exists(lib_floder):
            os.mkdir(lib_floder)
        if os.path.exists(os.path.join(lib_floder, "arm64-v8a")):
            res = "/lib/arm64-v8a"
        else:
            if os.path.exists(os.path.join(lib_floder, "armeabi-v7a")):
                res = "/lib/armeabi-v7a"
            else:
                if os.path.exists(os.path.join(lib_floder, "armeabi")):
                    res = "/lib/armeabi"
                else:
                    os.mkdir(os.path.join(lib_floder, "armeabi"))
                    res = "/lib/areabi"

        if os.path.exists(deco_path):
            assets = os.path.join(deco_path, "assets")
            if os.path.exists(assets):
                file_lists = list_all_files(assets)
                for file in file_lists:
                    name = file.split("/")[-1]
                    if is_ELFfile(file):
                        # copy
                        os.system("cp " + file + " " + deco_path + res + "/")
                        # add the .so
                        if not name.endswith(".so"):
                            lst = name.rsplit(".", 1)[0] + ".so"
                            os.system("cp " + file + " " + deco_path + res + "/" + lst)
                        # add the start lib
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
            # rm the lib folder
            abi = os.path.join(lib_floder, "armeabi")
            if os.path.exists(abi) and len(os.listdir(abi)) == 0:
                os.rmdir(os.path.join(lib_floder, "armeabi"))
            if len(os.listdir(lib_floder)) == 0:
                os.rmdir(lib_floder)
        print(" [+] finish find the other folder so file")

    def remove(self):
        # remove the decompile folder,report.txt,out
        ans = [os.path.join(self.Decompile_path, self.apkname), self.name,
               os.path.join(self.Report_path, self.apkname + ".txt")]
        for i in ans:
            utils.remove_dir(i)
        # empty folder
        ans = [self.Decompile_path, self.Report_path, self.out_path]
        for i in ans:
            if not os.listdir(i):
                utils.remove_dir(i)

    def report(self, flag_remove):
        utils.create_floder(self.Report_path)
        apk_report = os.path.join(self.Report_path, self.apkname + ".txt")
        print(" [+] analysis the " + self.name)

        # get the apk informations
        if not os.path.exists(apk_report):
            os.mknod(apk_report)
            with open(apk_report, "a") as f:
                f.write("[apk]\n")
                f.write("name = " + self.name + "\n")
                f.write("so_files = " + utils.get_so_files(self.Decompile_path, self.apkname) + "\n")
                f.write("native_activities = " + utils.get_native_activity(self.Decompile_path, self.apkname) + "\n")
                f.write("native_method = " + utils.get_native_methods(self.Decompile_path, self.apkname) + "\n")
            f.close()
        else:
            print(" [+] Collect the infomations from apktool.\n")

        # if utils.get_so_files(self.Decompile_path, self.apkname) == "" or len(
        #         utils.get_native_methods(self.Decompile_path, self.apkname)) == 0:
        #     print(" [*] the " + self.apkname + " no so file.")
        #
        #     if utils.get_so_files(self.Decompile_path, self.apkname) == "":
        #         raise ToolsException(
        #             " [+] " + self.apkname + " \n The apk don't have so file.")
        #     elif len(utils.get_native_methods(self.Decompile_path, self.apkname)) == 0:
        #         raise ToolsException(
        #             " [+] " + self.apkname + " \n samli code not find the native function.[maye be pure native apk]")
        #     if flag_remove:
        #         self.remove()
        if len(utils.get_native_methods(self.Decompile_path, self.apkname)) == 0:
            if flag_remove:
                self.remove()
            raise ToolsException(
                " [+] " + self.apkname + " \n samli code not find the native function.[maye be pure native apk or no native]")


if __name__ == "__main__":
    # apk_path = "apk/Native1.apk"
    # out_paths = "out"
    # python Preprocess.py apk/Native1.apk out
    apk_path = sys.argv[1]
    out_paths = sys.argv[2]
    pre_deal = Preprocess(apk_path, out_paths)
    pre_deal.apktool(False)
    pre_deal.result()
    pre_deal.report(False)
