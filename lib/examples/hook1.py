import frida
import sys
import time
import os


jscode = """
send("start");

Interceptor.attach(Module.findExportByName("libwannengrec.so", "JNI_OnLoad"), {
    onEnter: function (args) {
        send(" [+] enter ");
    },
    onLeave: function (retval){
        send(env.getStringUtfChars(retval).readCString());
        send(" [+] leave ");
    }
});



"""


def printMessage(message, data):
    if message['type'] == 'send':
        print('{0}'.format(message['payload']))
    else:
        print("error:", message)


devices = frida.get_usb_device()
# 循环下面语句

pid = devices.spawn("/data/local/tmp/server")

devices.resume(pid)
session = devices.attach(pid)

script = session.create_script(jscode)

script.on('message', printMessage)
script.load()

sys.stdin.read()
    
