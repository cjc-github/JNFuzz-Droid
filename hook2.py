import frida
import sys
import time
import os

taint_nums = []
taint_value_set = set()
taint_addr_set = set()
pathfile = ""


# 保存到reports.txt中
def save_outcome_file(output, line):
    file_name = os.path.join(output, "apk_outcome.txt")
    with open(file_name, "a") as f:
        f.write(line+"\n")
    f.close()


# trace path
def trace_path(list, statement):
    for j in list:
        if j in statement:
            return j
    return ""



def judge(statement):
    # total_num总次数
    sink_num, total_num = 0, 0
    sinklist = ["__android_log_print", "LOG", "send", "funreturn", "write", "sendto", "execvp", "execve", "execv",
                "execl", "execle", "execlp"]
    tracelist = ["GetStringUTFChars", "atoll", "atoi"]
    # source
    if "Taint:" in statement:
        total_num = total_num + 1
        # write the apk
        if len(taint_nums) > sink_num:
            sink_num = taint_nums
            save_outcome_file("./", pathfile + " " + str(sink_num))
        sink_num = 0
        taint_nums.clear()
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
            # if len(statement.split(" ")) > 2 and statement.split(" ")[1] == k:
            if k in statement:
                if len(statement.split(" ")) == 4:
                    if "value:" in statement:
                        value = statement.split(" ")[2][6:]
                        if value in taint_value_set:
                            taint_nums.append(k)
                            print("Find the Taint Path.")
                        # add analysised outcome
                        elif k == "funreturn" and value == "34w58wwwwwwwwww" and "310260000000000" in taint_value_set:
                            print("Find the Taint Path.")
                        else:
                            # contain
                            for m in taint_value_set:
                                if m in value:
                                    print("Find the Taint Path.")
                    elif "addr:" in statement:
                        addr = statement.split(" ")[3][5:]
                        if addr in taint_addr_set:
                            taint_nums.append(k)
                            print("Find the Taint Path.")
                elif len(statement.split(" ")) == 3:
                    if "addr:" in statement:
                        addr = statement.split(" ")[2][5:]
                        if addr in taint_addr_set:
                            taint_nums.append(k)
                            print("Find the Taint Path.")


# 对打印的结果进行判断
def printMessage(message, data):
    if message['type'] == 'send':
        judge(message['payload'])
        # print('{0}'.format(message['payload']))
    else:
        print("36", message)


if __name__ == "__main__":
    info = sys.argv[1]
    pathfile = info.split("path")[0] + " path" + info.split("path")[1]

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
