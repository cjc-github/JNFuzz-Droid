import os

# sinks = ["__android_log_print", "__android_log_write", "connect", "exec", "fork",
#          "fwrite", "write", "printf", "sprintf",
#          "open", "popen", "fopen", "fdopen", "dlopen", "dlsym",
#          "inet_aton", "inotify_add_watch", "inotify_init",
#          "read", "fread",
#          "send", "sendto", "socket",
#          "strcpy", "strcmp", "memcpy", "memcmp",
#          "chmod", "access", "atoi"]
sinks=[]

# add sink
def addsink(fun_name):
    context = ""
    if fun_name == "__android_log_print":
        context = """
        {onEnter: function(args) {
            send("Hook stringFromJNI start");
            var se1= Memory.readCString(args[1]);
            send("LOG para one:" + se1);
            var se = Memory.readCString(args[2]);
            send(typeof(se));
            if (se.indexOf("%s") >= 0){
                var se1=Memory.readCString(args[3]);
                send("LOG para three:"+se1);
            } else if (se.indexOf("%lld") >= 0){
                console.log(args[3]);
                send(args[3].toInt32());
            } else {
                send("22");
                console.log(args[3]);
            }
            send("LOG para two:"+se);
        },
        });
        """
    return context


def create_hook_py(file_path, arch, apkname, so_list):

    # save data
    f = open("hook.py", "w")
    start = '''import frida
import sys
import time
import os

from utils import utils

jscode = \"\"\"

setImmediate(function() {
    send("start..");
        '''
    f.write(start)
    #for key in taint_sink_map:
    #    for func in taint_sink_map[key]:
    for i in so_list:
        inter=f"""Interceptor.attach(Module.findExportByName("{i}","__android_log_print"),
    """
        f.write(inter)
        context=addsink("__android_log_print")
        f.write(context)

    end = """
});
\"\"\"


def printMessage(message, data):
    if message['type'] == 'send':
        print('{0}'.format(message['payload']))
        if message['payload'] ==1123919046:
            print("Find the taint Path")
            time.sleep(60)
            # 保存到report.txt
            line = "Find the taint Path"
            utils.save_file("./", line)
            # 关闭终端
            #cmd = "pgrep bash| xargs kill -s 9"
            #os.system(cmd)
    else:
        print("36", message)


devices = frida.get_usb_device()
# 循环下面语句

pid = devices.spawn("/data/local/tmp/server")

devices.resume(pid)
session = devices.attach(pid)
script = session.create_script(jscode)
try: 
    script.on('message', printMessage)
    script.load()
except:
    print("except")

sys.stdin.read()
        """
    f.write(end)
