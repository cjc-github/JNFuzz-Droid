import frida
import sys
import time
import os

taint_value_set = set()
taint_addr_set = set()
taint_fun_set = set()
record_num = [0]
pathfile = ""


# first
def save_outcome_file(fun_set, num):
    file_name = os.path.join("./", "apk_outcome.txt")
    if num == 1:
        with open(file_name, "a") as f:
            f.write(fun_set + ";")
        f.close()


def save_outcome_set_file(pathfile, fun_set, record_num):
    file_name = os.path.join("./", "apk_outcome.txt")
    if record_num != 1:
        if len(fun_set) >= 0:
            # 保存第一次且和之前的一样
            flist, flag = [], 0
            with open(file_name, "r") as f:
                lines = f.readlines()
                if str(fun_set) not in lines[-1]:
                    flag = 1
            f.close()

            # write
            if flag == 1:
                with open(file_name, "a") as f:
                    f.write(str(fun_set))
                f.close()


def trace_path(list, statement):
    for j in list:
        if j in statement:
            return j
    return ""


def judge(statement):
    sinklist = ["__android_log_print", "LOG", "send", "funreturn", "write", "sendto", "execvp", "execve", "execv",
                "execl", "execle", "execlp", "putExtra"]
    tracelist = ["GetStringUTFChars", "atoll", "atoi", "strcat", "strcpy", "strncpy", "memcpy"]
    # source
    if "Taint:" in statement:
        # record the Fuzz num
        record_num[0] += 1
        save_outcome_set_file(pathfile, taint_fun_set, record_num[0])
        taint_fun_set.clear()
        taint_value_set.clear()
        taint_addr_set.clear()
        if len(statement.split(" ")) == 4:
            if "value:" in statement:
                value = statement.split(" ")[2][6:]
                taint_value_set.add(value)
            if "addr:" in statement:
                addr = statement.split(" ")[3][5:]
                taint_addr_set.add(addr)
        elif len(statement.split(" ")) == 3:
            if "addr:" in statement:
                addr = statement.split(" ")[2][5:]
                taint_addr_set.add(addr)
    # trace
    elif trace_path(tracelist, statement):
        if " trace-" in statement:
            if "trace-value" in statement:
                sou = statement.split("trace-value:")[1].split("->")[0]
                des = statement.split("trace-value:")[1].split("->")[1]
                if sou in taint_value_set:
                    taint_value_set.add(des)
            if "trace-addr" in statement:
                sou = statement.split("trace-addr:")[1].split("->")[0]
                des = statement.split("trace-addr:")[1].split("->")[1]
                if sou in taint_addr_set:
                    taint_addr_set.add(des)
    # sink
    else:
        for k in sinklist:
            if k in statement:
                if len(statement.split(" ")) == 4:
                    if "value:" in statement:
                        value = statement.split(" ")[2][6:]
                        if value in taint_value_set:
                            print("Find the Taint Path.")
                            taint_fun_set.add(k)
                            save_outcome_file(k, record_num[0])
                        # add analysised outcome
                        elif k == "funreturn" and value == "34w58wwwwwwwwww" and "310260000000000" in taint_value_set:
                            print("Find the Taint Path.")
                            taint_fun_set.add(k + ":classical cryptography")
                            save_outcome_file(k + " :classical cryptography", record_num[0])
                        else:
                            # contain
                            for m in taint_value_set:
                                if m in value:
                                    print("Find the Taint Path.")
                                    taint_fun_set.add(k + ":contain")
                                    save_outcome_file(k + ":contain", record_num[0])
                    elif "addr:" in statement:
                        addr = statement.split(" ")[3][5:]
                        if addr in taint_addr_set:
                            print("Find the Taint Path.")
                            taint_fun_set.add(k)
                            save_outcome_file(k, record_num[0])
                elif len(statement.split(" ")) == 3:
                    if "addr:" in statement:
                        addr = statement.split(" ")[2][5:]
                        if addr in taint_addr_set:
                            print("Find the Taint Path.")
                            taint_fun_set.add(k)
                            save_outcome_file(k, record_num[0])


# 对打印的结果进行判断
def printMessage(message, data):
    if message['type'] == 'send':
        judge(message['payload'])
        print('{0}'.format(message['payload']))
    else:
        print("36", message)


if __name__ == "__main__":
    info = sys.argv[1]
    pathfile = info.split("path")[0] + " path" + info.split("path")[1]

    file_name = os.path.join("./", "apk_outcome.txt")
    with open(file_name, "a") as f:
        f.write("\n" + pathfile + ":")
    f.close()

    devices = frida.get_usb_device()
    # 循环下面语句

    # spawn->resume->attach
    pid = devices.spawn("/data/local/tmp/server")

    devices.resume(pid)

    session = devices.attach(pid)

    jscode = ""
    with open("utils_cmd/agent.js", "r") as f:
        lines = f.readlines()
        for i in lines:
            jscode += i
    # jscode=f.read()
    f.close()

    print(" [+] load the js.")
    script = session.create_script(jscode)
    time.sleep(2)

    script.on('message', printMessage)
    script.load()

    sys.stdin.read()
