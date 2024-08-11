# Add the custom Source instance to the Fuzz process
from utils.utils import save_file

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
                  ["queryIntentServices:(", "java.lang.String", "com.android.camera.CameraActivity"],
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

assign_basic_type_dict = {
    "int": lambda x: f"jint par{x} = 0;",
    "long": lambda x: f"jlong par{x} = 1;",
    "byte": lambda x: f"jbyte par{x} = 1;",
    "boolean": lambda x: f"jboolean par{x} = 1;",
    "short": lambda x: f"jshort par{x} = 1;",
    "char": lambda x: f"jchar par{x} = '0';",
    "float": lambda x: f"jfloat par{x} = 3.14;",
    "double": lambda x: f"jdouble par{x} = 3.14;",
}

assign_type_dict = {
    "Context": lambda x: f"jobject par{x} = getGlobalContext(env);",
    "int[]": lambda x: f"jint par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "long[]": lambda x: f"jlong par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "byte[]": lambda x: f"jbyte par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "boolean[]": lambda x: f"jboolean par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "short[]": lambda x: f"jshort par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "char[]": lambda x: f"jchar par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "float[]": lambda x: f"jfloat par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};",
    "double[]": lambda x: f"jdouble par{x}[10] = {{1, 0, 1, 0, 1, 0, 1, 0, 1, 0}};"
}


# register the variables
def register_localref(list, data, num):
    list.append(data)
    list.append(", par" + str(num))
    list.append("")
    return list, num + 1


# release the local reference
def release_localref(list, data, num):
    list.append(data)
    list.append(", par" + str(num))
    list.append("env->DeleteLocalRef(par" + str(num) + ");")
    return list, num + 1


# release the local reference
def release_localref_env(list, data, num):
    list.append(data)
    list.append(", par" + str(num))
    list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
    return list, num + 1


def assign_source(out_path, line, num, list, taintpath, apkname):
    types = line.split("type:")[1][:-2]
    for source in sources_string:
        if source[0] in taintpath and types == source[1]:
            data0 = "jstring par" + str(num) + " = env->NewStringUTF(\"" + source[2] + "\");"
            list, num = release_localref(list, data0, num)
            return list, num
        elif source[0] in taintpath and types == source[1] + "[]":
            data0 = "jobjectArray par" + str(num) + " = getStringArray(env,\"" + source[2] + "\");"
            list, num = release_localref(list, data0, num)
            return list, num

    if "onLocationChanged" in taintpath and types == "double":
        data0 = "jdouble par" + str(num) + " = 28.685;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif "onLocationChanged" in taintpath and types == "float":
        data0 = "jfloat par" + str(num) + " = 28.685;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif "getSubscriberId" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 15;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif ("getDeviceId" in taintpath or "toString" in taintpath or "toByteArray" in taintpath
          or "obtainMessage" in taintpath) and types == "byte[]":
        data0 = "jbyte par" + str(num) + "[16] = {3,5,8,2,4,0,0,5,1,1,1,1,1,1,0};"
        list, num = release_localref(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "short[]":
        data0 = "jshort par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list, num = release_localref(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list, num = release_localref(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 512;"
        list, num = release_localref(list, data0, num)
        return list, num

    # if types in ["Context", "Handler", "Bundle", "Intent", "PendingIntent", "Object"]:
    if types in assign_basic_type_dict:
        data0 = assign_basic_type_dict[types]
        list, num = register_localref(list, data0, num)
    elif types in assign_type_dict:
        data0 = assign_type_dict[types]
        list, num = release_localref(list, data0, num)
    elif types == "java.lang.String":
        data = line.split(", ")[1].split(":")[1]
        data0 = "jstring par" + str(num) + " = env->NewStringUTF(\"" + data + "\");"
        list, num = release_localref(list, data0, num)
    else:
        data0 = "jobject par" + str(num) + " = NULL;"
        list, num = release_localref(list, data0, num)
        save_file(out_path, " [!]" + apkname + " the complex type is taint.")
    return list, num


def assign_source_x86(out_path, line, num, list, taintpath, apkname):
    types = line.split("type:")[1][:-2]
    for source in sources_string:
        if source[0] in taintpath and types == source[1]:
            data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + source[2] + "\");"
            list, num = release_localref_env(list, data0, num)
            return list, num
        elif source[0] in taintpath and types == source[1] + "[]":
            data0 = "jobjectArray par" + str(num) + " = getStringArray(env,\"" + source[2] + "\");"
            list, num = release_localref_env(list, data0, num)
            return list, num

    if "onLocationChanged" in taintpath and types == "double":
        data0 = "jdouble par" + str(num) + " = 28.685;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif "onLocationChanged" in taintpath and types == "float":
        data0 = "jfloat par" + str(num) + " = 28.685;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif "getSubscriberId" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 15;"
        list, num = register_localref(list, data0, num)
        return list, num
    elif ("getDeviceId" in taintpath or "toString" in taintpath or "toByteArray" in taintpath
          or "obtainMessage" in taintpath) and types == "byte[]":
        data0 = "jbyte par" + str(num) + "[16] = {3,5,8,2,4,0,0,5,1,1,1,1,1,1,0};"
        list, num = release_localref_env(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "short[]":
        data0 = "jshort par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list, num = release_localref_env(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list, num = release_localref_env(list, data0, num)
        return list, num
    elif "read" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 512;"
        list, num = release_localref_env(list, data0, num)
        return list, num

    # if types in ["Context", "Handler", "Bundle", "Intent", "PendingIntent", "Object"]:
    if types in assign_basic_type_dict:
        data0 = assign_basic_type_dict[types]
        list, num = register_localref(list, data0, num)
    elif types in assign_type_dict:
        data0 = assign_type_dict[types]
        list, num = release_localref_env(list, data0, num)
    elif types == "java.lang.String":
        data = line.split(", ")[1].split(":")[1]
        data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + data + "\");"
        list, num = release_localref_env(list, data0, num)
    else:
        data0 = "jobject par" + str(num) + " = NULL;"
        list, num = release_localref_env(list, data0, num)
        save_file(out_path, " [!]" + apkname + " the complex type is taint.")
    return list, num
