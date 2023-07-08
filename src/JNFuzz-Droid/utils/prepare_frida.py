import os


# prepare the frida servers
def pre_frida():
    print(" [+] adb connected.")
    cmd = "adb root"
    print(cmd)
    os.system(cmd)

    cmd = "adb forward tcp:27042 tcp:27042"
    print(cmd)
    os.system(cmd)

    cmd = "adb forward tcp:27043 tcp:27043"
    print(cmd)
    os.system(cmd)

    cmd = "adb push lib/afl-fuzz/arm64-v8a/afl-fuzz /data/local/tmp"
    print(cmd)
    os.system(cmd)

    cmd = "adb push lib/frida-server/arm64-v8a/frida-server /data/local/tmp"
    print(cmd)
    os.system(cmd)

    cmd = "adb shell 'su -c chmod 755 /data/local/tmp/frida-server'"
    print(cmd)
    os.system(cmd)
    print(" [+] Frida service finish.")

# adb via tcp network
# adb tcpip 5555
# adb connect 192.168.1.114:5555
