import frida
import sys
import time
import os

taint_all_fun = []
taint_value_set = set()
taint_addr_set = set()
taint_fun_list = []
pathfile = ""
java_path = []

sources_string = [["getDeviceId:()", "java.lang.String", "358240051111110"],
                  ["getSubscriberId:()", "java.lang.String", "310260000000000"],
                  ["getSimSerialNumber:()", "java.lang.String", "89014103211118510720"],
                  ["getLine1Number:()", "java.lang.String", "15555215554"],
                  ["getAddress:()", "java.lang.String", "02:00:00:00:00:00"],
                  ["getMacAddress:()", "java.lang.String", "02:00:00:00:00:00"],
                  ["getSSID:()", "java.lang.String", "34:96:72:15:fc:8c"],
                  ["getCountry:()", "java.lang.String", "china"],
                  ["getInstalledApplications:(", "java.lang.String", "com.android.camera.CameraActivity"],
                  ["getInstalledPackage:(", "java.lang.String", "com.android.camera.CameraActivity"],
                  ["queryIntentServices:(", "java.lang.String",
                   "com.android.camera.CameraActivity"],
                  ["queryIntentActivities:(", "java.lang.String", "com.android.camera.CameraActivity"],
                  ["queryBroadcastReceivers:(", "java.lang.String", "com.android.camera.CameraActivity"],
                  ["queryContentProviders:(", "java.lang.String", "com.android.camera.CameraActivity"],
                  ["query:(", "java.lang.String", "zhangsan"],
                  ["read:(", "java.lang.String", "1010101010"],
                  ["getEntity:(", "java.lang.String", "http-status-200"],
                  ["getOutputStream:()", "java.lang.String", "358240051111110"],
                  ["getInputStream:()", "java.lang.String", "358240051111110"],
                  ["getEntity:()", "java.lang.String", "{'username':'admin','password':'123'}"],
                  ["toString:(", "java.lang.String", "358240051111110"],
                  ["toByteArray:(", "java.lang.String", "358240051111110"],
                  ["obtainMessage:(", "java.lang.String", "358240051111110"],
                  ["getContentCharSet:(", "java.lang.String", "utf-8"],
                  ["getBroadcast:(", "java.lang.String", "358240051111110"]]


def save_unique_fun(taint_fun_set, fun_name):
    if fun_name not in taint_fun_set:
        taint_fun_set.append(fun_name)


def save_outcome_file(taint_fun_list):
    out_come = os.path.join("./", "apk_outcome.txt")
    with open(out_come, "a") as f:
        f.write(str(taint_fun_list) + "\n")
    f.close()


def judge_va(statement):
    if " value:" in statement and " addr:" in statement:
        return True
    return False


def judge_a(statement):
    if "addr:" in statement:
        return True
    return False


def trace_path(trace_fun_list, statement):
    for trace_fun in trace_fun_list:
        if trace_fun in statement:
            return trace_fun
    return False


def sink_judge(sink_fun_list, statement):
    for sink_fun in sink_fun_list:
        if " " + sink_fun + "[" in statement:
            return sink_fun
    return False


def add_taint_value(taint_value_set, source):
    for i in sources_string:
        if i[0] in source:
            taint_value_set.add(i[2])


def judge(statement):
    sink_fun_list = ["__android_log_print", "LOG", "send", "funreturn", "write", "sendto", "execvp", "execve", "execv",
                     "execl", "execle", "execlp", "putExtra", "print", "fput", "fwrite", "fputs", "fputc", "printf",
                     "sendTextMessage"]
    trace_fun_list = ["JNIEnv->GetStringUTFChars", "atoll", "atoi", "strcat", "strcpy", "strncpy", "memcpy"]
    if "Taint:" in statement:
        taint_fun_list.clear()
        taint_value_set.clear()
        taint_addr_set.clear()
        # java
        taint_fun_list.append(java_path[0])
        taint_fun_list.append(java_path[1])

        # if the get value failed,we add the tainted value
        add_taint_value(taint_value_set, java_path[0])

        if judge_va(statement):
            # if len(statement.split(" ")) == 4:
            if "value:" in statement:
                value = statement.split(" ")[2][6:]
                taint_value_set.add(value)
            if "addr:" in statement:
                addr = statement.split(" ")[3][5:]
                taint_addr_set.add(addr)
        elif judge_a(statement):
            # elif len(statement.split(" ")) == 3:
            if "addr:" in statement:
                addr = statement.split(" ")[2][5:]
                taint_addr_set.add(addr)
    elif trace_path(trace_fun_list, statement):
        if " trace-" in statement:
            if "trace-value" in statement:
                value_tran = statement.split("trace-value:")[1].split("->")
                sou = value_tran[0]
                des = value_tran[1]
                if sou in taint_value_set:
                    save_unique_fun(taint_fun_list, statement.split(" ")[1])
                    taint_value_set.add(des)
            if "trace-addr" in statement:
                address_tran = statement.split("trace-addr:")[1].split("->")
                sou = address_tran[0]
                des = address_tran[1]
                if sou in taint_addr_set:
                    save_unique_fun(taint_fun_list, statement.split(" ")[1])
                    taint_addr_set.add(des)
    else:
        flag = 0
        if sink_judge(sink_fun_list, statement):
            if judge_va(statement):
                # if len(statement.split(" ")) == 4:
                if "value:" in statement:
                    value = statement.split("value:")[1].split(" addr:")[0]
                    # value = statement.split(" ")[2][6:]
                    # print("92", statement, value, taint_value_set)
                    if value in taint_value_set:
                        print(" [!] Find the Taint Path.")
                        flag = 1
                        save_unique_fun(taint_fun_list, statement.split(" ")[1])
                    # add analysised outcome
                    elif "funreturn" in statement and value == "34w58wwwwwwwwww" and "310260000000000" in taint_value_set:
                        print(" [!] Find the Taint Path.")
                        flag = 1
                        save_unique_fun(taint_fun_list, statement.split(" ")[1] + ":<classical cryptography>")
                    else:
                        for m in taint_value_set:
                            if m in value:
                                print(" [!] Find the Taint Path.")
                                flag = 1
                                save_unique_fun(taint_fun_list, statement.split(" ")[1] + ":<containt>")
                elif "addr:" in statement:
                    addr = statement.split(" ")[3][5:]
                    if addr in taint_addr_set:
                        print(" [!] Find the Taint Path.")
                        flag = 1
                        save_unique_fun(taint_fun_list, statement.split(" ")[1])
            elif judge_a(statement):
                # elif len(statement.split(" ")) == 3:
                if "addr:" in statement:
                    addr = statement.split(" ")[2][5:]
                    if addr in taint_addr_set:
                        print(" [!] Find the Taint Path.")
                        flag = 1
                        save_unique_fun(taint_fun_list, statement.split(" ")[1])
            if flag == 1 and taint_fun_list not in taint_all_fun:
                taint_all_fun.append(taint_fun_list[:])
                save_outcome_file(taint_fun_list)


def printMessage(message, data):
    if message['type'] == 'send':
        judge(message['payload'])
        print('{0}'.format(message['payload']))
    else:
        print()
        # print("36", message)


if __name__ == "__main__":
    # save java information
    info = sys.argv[1]
    with open(info, "r") as f:
        lists = f.readlines()
    f.close()
    java_path.append(lists[0].strip().split(";.")[1])
    java_method = lists[1].split("sequence:{")[1].split(" ")[0] + "[" + lists[1].split(" ")[1][:-2] + "]"
    java_path.append(java_method)

    pathfile = info.split("/")[-2] + " " + info.split("/")[-1] + " Taint Path:\n"

    file_name = os.path.join("./", "apk_outcome.txt")
    with open(file_name, "a") as f:
        f.write(pathfile)
    f.close()

    devices = frida.get_usb_device()
    # spawn->resume->attach
    pid = devices.spawn("/data/local/tmp/server")
    devices.resume(pid)
    session = devices.attach(pid)

    jscode = ""
    with open("utils_cmd/agent.js", "r") as f:
        lines = f.readlines()
        for i in lines:
            jscode += i
    f.close()

    print(" [+] load the js.")
    script = session.create_script(jscode)
    time.sleep(3)

    script.on('message', printMessage)
    script.load()
    sys.stdin.read()
