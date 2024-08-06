import os
import logging

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


# add the .apk suffix to non-apk endings
def deal_apk(apk_name):
    if not apk_name.endswith(".apk"):
        os.rename(apk_name, apk_name + ".apk")
        return apk_name + ".apk"
    return apk_name


def get_apkname(apk_path):
    return apk_path[:-4].rsplit("/", 1)[1]


# create new folder
def create_floder(folder):
    if not os.path.exists(folder):
        os.mkdir(folder)


# create a script file
def create_script_file(folder, filename):
    num = 1
    folder = os.path.join(folder, filename)
    if os.path.exists(folder):
        while True:
            file = os.path.join(folder, f"script_{num}.txt")
            if not os.path.exists(file):
                f = open(file, "w")
                f.close()
                return file
            else:
                num = num + 1
    else:
        logging.error("[*] can't create the script file.")


# remove dir
def remove_dir(folder):
    if os.path.isdir(folder):
        for p in os.listdir(folder):
            remove_dir(os.path.join(folder, p))
        if os.path.exists(folder):
            os.rmdir(folder)
    else:
        if os.path.exists(folder):
            os.remove(folder)


# save tmp_lists to taint_txt
def write_tofile(tmp_lists, taint_txt):
    with open(taint_txt, "w") as f:
        for i in tmp_lists:
            for j in i:
                f.write(j)


# save to reports.txt中
def save_file(output, line):
    file_name = os.path.join(output, "report.txt")
    with open(file_name, "a") as f:
        f.write(line + "\n")


def save_static_time(output, line):
    filename = os.path.join(output, "static_exec_time.txt")
    with open(filename, "a") as f:
        f.write(line + "\n")


# list all files
def list_all_files(file_name):
    _files = []
    list_file = os.listdir(file_name)
    for i in range(0, len(list_file)):
        path = os.path.join(file_name, list_file[i])
        if os.path.isdir(path):
            _files.extend(list_all_files(path))
        if os.path.isfile(path):
            _files.append(path)
    return _files
