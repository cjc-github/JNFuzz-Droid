import os
import time
import shlex
import psutil
import subprocess

from utils.exception import ToolsException
from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


def terminate_process_tree(pid):
    parent = psutil.Process(pid)
    children = parent.children(recursive=True)

    for child in children:
        try:
            child.terminate()
        except psutil.NoSuchProcess:
            pass
    gone, still_alive = psutil.wait_procs(children, timeout=5)
    for p in still_alive:
        p.kill()

    try:
        parent.terminate()
    except psutil.NoSuchProcess:
        pass
    gone, still_alive = psutil.wait_procs([parent], timeout=5)
    for p in still_alive:
        p.kill()


# os.popen is nonblocking
def rcmd1(cmd):
    log.info(cmd)
    _p = os.popen(cmd,
                  mode="r",
                  buffering=-1
                  )
    output = _p.read()
    # print(output)


def rcmd2(cmd):
    try:
        start_time = time.time()
        _p = subprocess.Popen(cmd,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              shell=True,
                              text=True
                              )
        stdout, stderr = _p.communicate()
        end_time = time.time()
        formatted_time = "{:.2f}".format(end_time - start_time)
        log.info(f"[+] exec '{cmd}' token {formatted_time}s.")

    except Exception as e:
        log.error(f"[!] exec '{cmd}' failed: {e}.")
        raise ValueError(f" [!] exec '{cmd}' failed: {e}.")


def rcmd3(cmd, timeout):
    try:
        start_time = time.time()
        _p = subprocess.Popen(cmd,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              shell=True,
                              text=True
                              )
        try:
            output, error = _p.communicate(timeout=timeout)
            # log.error(f"\n{error}")

            end_time = time.time()
            formatted_time = "{:.2f}".format(end_time - start_time)
            log.info(f"[+] exec '{cmd}' token {formatted_time}s.")
        except subprocess.TimeoutExpired:
            # _p.terminate()
            # _p.kill()
            terminate_process_tree(_p.pid)
            output, error = _p.communicate()
            log.error(f"Command timed out after {timeout} seconds.")

    except Exception as e:
        log.error(f"Error executing command: {e}.")


def rcmd4(cmd, timeout, apk_path, tool_name, output_path):
    filename = os.path.join(output_path, "static_exec_time.txt")
    with open(filename, "a") as f:
        f.write(apk_path)

    try:
        start_time = time.time()
        _p = subprocess.Popen(cmd,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              shell=True,
                              text=True
                              )
        try:
            output, error = _p.communicate(timeout=timeout)

            end_time = time.time()
            formatted_time = "{:.3f}".format(end_time - start_time)
            log.info(f"[+] exec '{cmd}' token {formatted_time}s.")

            with open(filename, "a") as f:
                f.write(f" >> {tool_name} : {formatted_time}s.\n")
        except subprocess.TimeoutExpired:
            # _p.terminate()
            # _p.kill()
            terminate_process_tree(_p.pid)
            output, error = _p.communicate()
            log.error(f"[!] Command timed out after {timeout} seconds.")

            with open(filename, "a") as f:
                f.write(f" >> {tool_name} analysis timeout.\n")

            raise ToolsException(f"[!] Command timed out after {timeout} seconds.")
    except Exception as e:
        log.error(f"Error executing command: {e}.")
        raise ToolsException(f"[!] Error executing command: {e}.")


def rcmd5(cmd, timeout, cwd):
    out_put = open(os.path.join(cwd, "out_put.txt"), "w")
    err_put = open(os.path.join(cwd, "err_put.txt"), "w")

    try:
        args = shlex.split(cmd)
        _p = subprocess.Popen(args,
                              shell=True,
                              stdout=out_put,
                              stderr=err_put,
                              text=True,
                              cwd=cwd,
                              )
        try:
            return_code = _p.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            terminate_process_tree(_p.pid)
            # _p.kill()
            # _p.terminate()
            return_code = _p.wait()
            log.error(f"Command timed out after {timeout} seconds.")

    except Exception as e:
        log.error(f"Error executing command: {e}.")
