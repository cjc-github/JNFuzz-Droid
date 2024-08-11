import os
import subprocess
from utils.run_command import rcmd1

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


def check_adb_connection(cmd):
    log.info(cmd)
    try:
        _p = subprocess.run(
            cmd.split(" "),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        if _p.returncode != 0:
            log.error("[!] Failed to execute adb devices command. ")
            log.error("[!] Please ensure ADB is properly configured in your environment.")
            raise ValueError(" [!] Failed to execute adb devices command.")

        output = _p.stdout
        lines = output.strip().split('\n')

        if len(lines) <= 1 or not lines[0].startswith('List of devices attached'):
            log.error("[!] No devices detected as connected.")
            raise ValueError(" [!] No devices detected as connected.")

        if len(lines) > 1:
            return True
        else:
            log.error("[!] No devices detected as connected.")
            raise ValueError(" [!] No devices detected as connected.")

    except Exception as e:
        log.error(f"[!] ADB connection check failed: {e}.")
        raise ValueError(f" [!] ADB connection check failed: {e}.")


# prepare the frida servers
def pre_frida(arch):
    log.info("[+] ADB connected.")
    cmd = "adb devices"
    if not check_adb_connection(cmd):
        return False

    log.info("[+] ADB connected success.")

    cmd = "adb root"
    rcmd1(cmd)

    cmd = "adb forward tcp:27042 tcp:27042"
    rcmd1(cmd)

    cmd = "adb forward tcp:27043 tcp:27043"
    rcmd1(cmd)

    if not arch:
        arch = "arm64-v8a"

    if arch not in ["arm64-v8a", "armeabi-v7a", "armeabi", "x86_64", "x86"]:
        raise ValueError(f"the cpu {arch} architecture is not exist.")

    path = f"lib/afl-fuzz/{arch}/afl-fuzz"
    if os.path.exists(path):
        cmd = f"adb push {path} /data/local/tmp"
        rcmd1(cmd)
    else:
        log.error(f"[!] {path} is not exist.")
        raise ValueError(f" [!] {path} is not exist.")

    path = f"lib/frida-server/{arch}/frida-server"
    if os.path.exists(path):
        cmd = f"adb push {path} /data/local/tmp"
        rcmd1(cmd)
    else:
        log.error(f"[!] {path} is not exist.")
        raise ValueError(f" [!] {path} is not exist.")

    cmd = "adb shell 'su -c chmod 755 /data/local/tmp/frida-server'"
    rcmd1(cmd)

    log.info("[+] Frida service finish.\n")


# ways for adb connect
# way1
# adb via tcp network
# adb tcpip 5555
# adb connect 192.168.1.114:5555

# way2
# usb

# test
if __name__ == "__main__":
    try:
        command = "adb devices"
        check_adb_connection(command)
        log.info("adb connect success.")
    except Exception as e:
        log.error(f"connect failed: {e}.")
