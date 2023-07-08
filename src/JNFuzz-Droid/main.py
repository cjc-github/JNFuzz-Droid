import argparse
import os.path
import sys
from datetime import datetime

from Continue_process import ContinueProcess
from FindAvd import FindAvd
from Generate_txt import Generate_txt
from Preprocess import Preprocess
from utils import prepare_frida
from utils import utils
from utils.exception import ToolsException, HaveException


def deal_apk_folder(apk_path):
    apk_list = []
    if not os.path.exists(apk_path):
        print(" [!] the folder is not exists.")
        sys.exit(0)
    elif not os.listdir(apk_path):
        print(" [!] the folder is empty.")
        sys.exit(1)
    for name in os.listdir(apk_path):
        app_path = os.path.join(apk_path, name)
        re = utils.deal_apk(app_path)
        apk_list.append(re)
    return apk_list


if __name__ == '__main__':
    print(" [+] ===Welcome to using Native Analysis.====\n")
    Title = " [+] Welcome to using Native Analysis."
    parser = argparse.ArgumentParser(description=Title)
    parser.add_argument("--i", "-i", default="apk", help="input dir.")
    parser.add_argument("--o", "-o", default="apk_out", help="output dir.")
    parser.add_argument("-a", help='using Amandroid enhance the static analysis.', action="store_true")
    parser.add_argument("-f", help='using Flowdroid enhance the static analysis.', action="store_true")
    parser.add_argument("-arch", help="Specified cpu architecture",
                        choices=['armeabi', 'armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64'])
    # parser.add_argument("-j", help='using jucify enhance the static analysis.', action="store_true")
    # parser.add_argument("-u", help='using jnfuzz testing analysis.', action="store_true")
    parser.add_argument("-r", help="remove apk information", action="store_true")
    parser.add_argument("-n", help="Fuzz only one time", action="store_true")
    parser.add_argument("-st", default=5400, type=int, help="the max runing the time (sec) of static analysis")
    parser.add_argument("-t", default=600, type=int, help="the max runing the time (sec) of Fuzzing")
    args = parser.parse_args()

    apk_lists = deal_apk_folder(args.i)
    out_folder = args.o

    status = False
    # status = True
    if not status:
        prepare_frida.pre_frida()

    assert args.a or args.f, "-a or -f options is must"

    for apk in apk_lists:
        # Preprocessing module
        print(" [+] 1/4 Prepare deal the " + apk + "\n")
        try:
            pre_deal = Preprocess(apk, out_folder, args.r)
            pre_deal.apktool()
            pre_deal.result()
            pre_deal.report()
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue

        print(" [+] 2/4 Continue deal.\n")
        try:
            pre_analysis = ContinueProcess(apk, out_folder, args.st, args.r)
            if args.a:
                pre_analysis.get_dynamic_methods()
                pre_analysis.taint()
                pre_analysis.appdata()

                print(" [+] 3/4 Create the script file.\n")
                gener = Generate_txt(apk, out_folder)
                gener.getgraph()
            elif args.f:
                print(" [+] Enhance: launch the enhance engine for FlowDroid")
                pre_analysis.taint_flowdroid()
            # elif args.j:
            #     print(" [+] Enhance: launch the enhance engine for Jucify")
            #     pre_analysis.taint_jucify()
            # elif args.u:
            #     print(" [+] using jnfuzz testing analysis")
            #     pre_analysis.jnfuzz_test()
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue
        print(" [+] 4/4 Launch avd or devices.\n")

        try:
            nowTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(" [+] start time:", nowTime)
            avd = FindAvd(apk, out_folder, args.arch, args.n, args.t)
            avd.find_arch()
            lastTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(" [+] end time:", lastTime)
        except HaveException as e:
            utils.save_file(out_folder, e.errorinfo)
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue
        print("\n [+] done.")
    else:
        print(" [+] Finish.")
