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
    parser.add_argument("-j", help='using jucify enhance the static analysis.', action="store_true")
    parser.add_argument("-u", help='using jnfuzz testing analysis.', action="store_true")
    parser.add_argument("-r", help="remove apk information", action="store_true")
    parser.add_argument("-n", help="Fuzz only one time", action="store_true")
    parser.add_argument("-t", default=5400, type=int, help="the max runing the time (min) of static analysis")
    args = parser.parse_args()

    apk_lists = deal_apk_folder(args.i)
    rf = args.r
    fuzz_one = args.n
    out_folder = args.o


    status = False
    status = True
    if not status:
        prepare_frida.pre_frida()

    for apk in apk_lists:
        try:
            print(" [+] 1/4 Prepare deal the " + apk + "\n")

            pre_deal = Preprocess(apk, out_folder)
            pre_deal.apktool(rf)
            pre_deal.result()
            pre_deal.report(rf)
        except HaveException as e:
            utils.save_file(out_folder, e.errorinfo)
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue

        try:
            print(" [+] 2/4 Continue deal.\n")
            pre_analysis = ContinueProcess(apk, out_folder, args.t)
            pre_analysis.get_dynamic_methods()
            # for jnfuzz,you should annotation the line
            if args.a:
                pre_analysis.taint()
                pre_analysis.appdata(rf)

                print(" [+] 3/4 Create the script file.\n")
                gener = Generate_txt(apk, out_folder)
                gener.getgraph()
                gener.optimize()
        except HaveException as e:
            utils.save_file(out_folder, e.errorinfo)
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue

        try:

            if args.f:
                print(" [+] Enhance: launch the enhance engine. For FlowDroid")
                pre_analysis.taint_flowdroid()
            if args.j:
                print(" [+] Enhance: launch the enhance engine. For Jucify")
                pre_analysis.taint_jucify()

            if args.u:
                print(" [+] using jnfuzz testing analysis")
                pre_analysis.jnfuzz_test()

        except HaveException as e:
            utils.save_file(out_folder, e.errorinfo)
        except ToolsException as e:
            utils.save_file(out_folder, e.errorinfo)
            continue

        try:
            print(" [+] 4/4 Launch avd or devices.\n")

            nowTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(" [+] start time:", nowTime)
            avd = FindAvd(apk, out_folder)
            avd.find_arch(fuzz_one)
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
