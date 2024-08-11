import os
import xml
import xml.dom
import xml.dom.minidom

from utils.utils import list_all_files
from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


# return so file
def get_so_files(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    if not os.path.exists(os.path.join(decompile_path, "lib")):
        return ""
    else:
        parent_abi = os.path.join(decompile_path, "lib")
        so_files = ""
        for abi in os.listdir(parent_abi):
            abi_paths = os.path.join(parent_abi, abi)
            if os.path.isdir(abi_paths):
                for abi_path in os.listdir(abi_paths):
                    so_path = os.path.join(abi_paths, abi_path)
                    if so_path.endswith(".so"):
                        so_files += so_path + ","
        return so_files[:-1]


# get native-activity
def get_native_activity(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    if not os.path.exists(os.path.join(decompile_path, "AndroidManifest.xml")):
        log.error("[!]" + name + " is not exist.")
        return ""
    else:
        tags = ""
        manifest = os.path.join(decompile_path, "AndroidManifest.xml")
        dom_tree = xml.dom.minidom.parse(manifest)
        collection = dom_tree.documentElement
        results = collection.getElementsByTagName("activity")
        for result in results:
            if result.getAttribute("android.app.NativeActivity"):
                tags = tags + result.getAttribute("android:name") + ","
                metas = result.getElementsByTagName("meta-data")
                for meta in metas:
                    if meta:
                        tags = tags + result.getAttribute("android:name") + ","
        return tags[:-1]


# add some third-library smail code file that do not analysis
def judge_third_library(file):
    if file.split("/")[4] == "android":
        return False
    if file.split("/")[4] == "androidx":
        return False
    if file.split("/")[4] == "com" and file.split("/")[5] == "google":
        return False
    return True


# deal smail code file, and return normative native method.
def smali_folder(file_name):
    num = len(file_name.split("/"))
    results = set()
    for file in list_all_files(file_name):
        file = file.replace("//", "/")
        # judge some third library file
        if judge_third_library(file):
            with open(file, "r") as f:
                lines = f.readlines()
                for line in lines:
                    if line.startswith(".method ") > 0 and line.find(" native ") > 0:
                        method = "L" + file.split("/", num)[-1][:-6] + ";." + line.split(" ")[-1].replace("(", ":(")
                        if line.find(" static ") > 0:
                            method = method.strip() + " 1"
                        else:
                            method = method.strip() + " 0"
                        results.add(method)
    return results


# obtain the native method name via analyzing decompiled smail code
# find the static and dynamic registration
def get_native_methods(decom_path, name):
    decompile_path = os.path.join(decom_path, name)
    results = ""
    for file_name in os.listdir(decompile_path):
        smali_path = os.path.join(decompile_path, file_name)
        if file_name.startswith("smali") and os.path.isdir(smali_path):
            result = smali_folder(smali_path)
            for re in result:
                results = results + re.strip() + ","
    return results[:-1]
