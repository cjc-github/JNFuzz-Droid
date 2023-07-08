import os.path

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


def changejs(target_native_name, so_file, file_path):
    if os.path.exists("utils_cmd/_agent.js"):
        print(" [+] generate the agent.js file")

        with open("utils_cmd/_agent.js", "r") as f:
            lines = f.readlines()
        f.close()

        with open(file_path, "r") as f:
            m_inf = f.readlines()
        f.close()

        # get taint value
        taint_customed, taint_field, taint_type = "", "", ""
        for i in sources_string:
            if i[0] in m_inf[0]:
                taint_customed = i[2]

        for i in m_inf:
            if i.startswith("method:"):
                return_type = i.split(" ")[0].split(")")[1]
            elif "is_tainted:true, " in i:
                # taint_field = int(i.split(":")[0][1:])
                taint_field = int(i.split(":")[0][1:]) + 1
                taint_type = i.split("type:")[1][:-2]

        space = " " * 4
        add_data = ""

        with open("./utils_cmd/agent.js", "w") as f:
            for index, line in enumerate(lines):
                if "let so_files = \"libleak.so\";" in line:
                    f.write(space * 2 + "let so_files = \"" + so_file + ".so\"" + ";")
                else:
                    if "hook_all_jni();" in line:
                        add_data += line
                        add_data += space * 2 + "Java.perform(function () {\n"
                        add_data += space * 3 + "Interceptor.attach(Module.findExportByName(\"" + so_file + ".so\", \"" + target_native_name + "\"), {\n"
                        add_data += space * 4 + "onEnter: function (args) {\n"
                        add_data += space * 5 + "send(\" [+] enter " + target_native_name + "\");\n"
                        add_data += space * 5 + "try{\n"
                        if taint_type == "java.lang.String":
                            # add_data += space * 6 + "send(` Taint: value:${args[" + taint_field + "].readUtf8String()} addr:${args[" + taint_field + "]}`);\n"
                            add_data += space * 6 + "send(` Taint: value:${Java.vm.tryGetEnv().getStringUtfChars(args[" + str(
                                taint_field) + "],null).readUtf8String()} addr:${args[" + str(taint_field) + "]}`);\n"
                        elif taint_type == "int":
                            add_data += space * 6 + "send(` Taint: value:${args[" + str(
                                taint_field) + "].toInt32()} addr:${args[" + str(taint_field) + "]}`);\n"
                        elif taint_type == "":
                            add_data += space * 6 + "send(` enter`);\n"
                        else:
                            add_data += space * 6 + "send(` Taint: value:" + taint_customed + " addr:${args[" + str(
                                taint_field) + "]}`);\n"
                        add_data += space * 5 + "}catch(e) {\n"
                        if taint_field != "":
                            add_data += space * 6 + "send(` Taint: addr:${args[" + str(taint_field) + "]}`);\n"
                        add_data += space * 5 + "}\n"
                        add_data += space * 4 + "},\n"
                        add_data += space * 4 + "onLeave(retval){\n"
                        add_data += space * 5 + "try{\n"
                        if return_type == "Ljava/lang/String;":
                            add_data += space * 6 + "send(` funreturn[0] value:${Java.vm.tryGetEnv().getStringUtfChars(retval, null).readUtf8String()} addr:${retval}`);\n"
                        elif return_type == "V":
                            add_data += space * 6 + "send(` funreturn[0] value:none addr:${retval}`);\n"
                        elif return_type == "I":
                            add_data += space * 6 + "send(` funreturn[0] value:${retval.toInt32()} addr:${retval}`);\n"
                        elif return_type == "":
                            add_data += space * 6 + "send(` leave`);\n"
                        else:
                            add_data += space * 6 + "send(` funreturn[0] addr:${retval}`);\n"
                        add_data += space * 5 + "} catch(e) {\n"
                        add_data += space * 6 + "send(` funreturn[0] addr:${retval}`);\n"
                        add_data += space * 5 + "}\n"
                        add_data += space * 5 + "send(\" [+] leave " + target_native_name + " \\n\\n\");\n"
                        add_data += space * 4 + "}\n"
                        add_data += space * 3 + "});\n"
                        add_data += space * 2 + "});\n"
                        f.write(add_data)
                    else:
                        f.write(line)
        f.close()
    else:
        print(" [*] the _agent.js not exist.")
