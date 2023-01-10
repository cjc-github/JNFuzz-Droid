import os.path


def changejs(res, file_path):
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

    if os.path.exists("utils_cmd/_agent.js"):
        print(" [+] generate the agent.js file")

        with open("utils_cmd/_agent.js", "r") as f:
            lines = f.readlines()
        f.close()

        with open(file_path, "r") as f:
            m_inf = f.readlines()
        f.close()
        taint_customed = ""
        for i in sources_string:
            if i[0] in m_inf[0]:
                taint_customed = i[2]

        cot = 0
        for i in m_inf:
            if i.startswith("method:"):
                ret = i.split(" ")[0].split(")")[1]
                res[cot].append("return:" + ret)
                cot += 1
            elif "is_tainted:true, " in i:
                num = i.split(":")[0][1:]
                type = i.split("type:")[1][:-2]
                res[cot - 1].append(str(int(num) + 1))
                res[cot - 1].append(type)
        print(res)

        # get the so file
        ans = set()
        for i in res:
            ans.add(i[0] + ".so")
        ans = list(ans)

        space = " " * 4

        with open("./utils_cmd/agent.js", "w") as f:
            for index, line in enumerate(lines):
                if "let so_files = [\"libleak.so\"];" in line:
                    f.write(space * 2 + "let so_files = " + str(ans)+";")
                else:
                    if "hook_all_jni();" in line:
                        f.write(line)
                        f.write(space * 2 + "Java.perform(function () {\n")
                        for j in res:
                            f.write(
                                space * 3 + "Interceptor.attach(Module.findExportByName(\"" + j[0] + ".so\", \"" + j[
                                    1] + "\"), {\n")
                            f.write(space * 4 + "onEnter: function (args) {\n")
                            f.write(space * 5 + "send(\" [+] enter " + j[1] + "\");\n")
                            # enter
                            if len(j) >= 3:
                                for k in range((len(j) - 3) // 2):
                                    # try catch
                                    f.write(space * 5 + "try{\n")
                                    if j[2 * k + 4] == "java.lang.String":
                                        f.write(space * 6 + "send(` Taint: value:${Java.vm.tryGetEnv().getStringUtfChars(args[" + j[2 * k + 3] + "],null).readUtf8String()} addr:${args[" + j[2 * k + 3] + "]}`);\n")
                                    elif j[2 * k + 4] == "int":
                                        f.write(space * 6 + "send(` Taint: value:${args[" + j[2 * k + 3]+"].toInt32()} addr:${args[" + j[2 * k + 3] + "]}`);\n")
                                    # elif j[2 * k + 4] =="java.lang.String[]":
                                    #     f.write("")
                                    else:
                                        f.write(space*6 + "send(` Taint: value:" + taint_customed + " addr:${args[" + j[2 * k + 3] + "]}`);\n")
                                    f.write(space * 5 + "}catch(e) {\n")
                                    f.write(space * 6 + "send(` Taint: addr:${args[" + j[2 * k + 3] + "]}`);\n")
                                    f.write(space * 5 + "}\n")

                                # f.write(space * 4 + "hook_custom_sys(\""+j[0]+".so\");\n")

                                f.write(space * 4 + "},\n")
                                f.write(space * 4 + "onLeave(retval){\n")
                                # leave
                                retpye = j[2][7:]
                                f.write(space * 5 + "try{\n")
                                if retpye == "Ljava/lang/String;":
                                    f.write(space * 6 + "send(` funreturn: value:${Java.vm.tryGetEnv().getStringUtfChars(retval,null).readUtf8String()} addr:${retval}`);\n")
                                elif retpye == "V":
                                    f.write(space * 6 + "send(` funreturn: value:none addr:${retval}`);\n")
                                elif retpye == "I":
                                    f.write(space * 6 + "send(` funreturn: value:${retval.toInt32()} addr:${retval}`);\n")
                                else:
                                    f.write(space * 6 + "send(` funreturn: addr:${retval}`);\n")
                                f.write(space * 5 + "} catch(e) {\n")
                                f.write(space * 6 + "send(` funreturn: addr:${retval}`);\n")
                                f.write(space * 5 + "}\n")

                                f.write(space * 5 + "send(\" [+] leave " + j[1] + " \\n\\n\");\n")
                            f.write(space * 4 + "}\n")
                            f.write(space * 3 + "});\n")
                        f.write(space * 2 + "});\n")
                    else:
                        f.write(line)
        f.close()
    else:
        print(" [*] the _agent.js not exist.")
