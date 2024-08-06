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


def assign_source(out_path, line, num, list, taintpath, apkname):
    types = line.split("type:")[1][:-2]
    for source in sources_string:
        if source[0] in taintpath and types == source[1]:
            data0 = "jstring par" + str(num) + " = env->NewStringUTF(\"" + source[2] + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("env->DeleteLocalRef(par" + str(num) + ");")
            num = num + 1
            return list, num
        elif source[0] in taintpath and types == source[1] + "[]":
            data0 = "jobjectArray par" + str(num) + " = getStringArray(env,\"" + source[2] + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("env->DeleteLocalRef(par" + str(num) + ");")
            num = num + 1
            return list, num

    if "onLocationChanged" in taintpath and types == "double":
        data0 = "jdouble par" + str(num) + " = 28.685;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif "onLocationChanged" in taintpath and types == "float":
        data0 = "jfloat par" + str(num) + " = 28.685;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif "getSubscriberId" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 15;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif ("getDeviceId" in taintpath or "toString" in taintpath or "toByteArray" in taintpath
          or "obtainMessage" in taintpath) and types == "byte[]":
        data0 = "jbyte par" + str(num) + "[16] = {3,5,8,2,4,0,0,5,1,1,1,1,1,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "short[]":
        data0 = "jshort par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 512;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
        return list, num

    # if types in ["Context", "Handler", "Bundle", "Intent", "PendingIntent", "Object"]:
    if types in "Context":
        data0 = "jobject par" + str(num) + " = getGlobalContext(env);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "int":
        data0 = "jint par" + str(num) + " = 0;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "long":
        data0 = "jlong par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "byte":
        data0 = "jbyte par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "boolean":
        data0 = "jboolean par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "short":
        data0 = "jshort par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "char":
        data0 = "jchar par" + str(num) + " = '0';"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "float":
        data0 = "jfloat par" + str(num) + " = 3.14;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "double":
        data0 = "jdouble par" + str(num) + " = 3.14;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "int[]":
        data0 = "jint par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "long[]":
        data0 = "jlong par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "byte[]":
        data0 = "jbyte par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "short[]":
        data0 = "jshort par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "char[]":
        data0 = "jchar par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "float[]":
        data0 = "jfloat par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "double[]":
        data0 = "jdouble par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    elif types == "java.lang.String":
        data = line.split(", ")[1].split(":")[1]
        data0 = "jstring par" + str(num) + " = env->NewStringUTF(\"" + data + "\");"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
    else:
        data0 = "jobject par" + str(num) + " = NULL;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("env->DeleteLocalRef(par" + str(num) + ");")
        num = num + 1
        save_file(out_path, " [+]" + apkname + " the complex type is taint")
    return list, num


def assign_source_x86(out_path, line, num, list, taintpath, apkname):
    types = line.split("type:")[1][:-2]
    for source in sources_string:
        if source[0] in taintpath and types == source[1]:
            data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + source[2] + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
            num = num + 1
            return list, num
        elif source[0] in taintpath and types == source[1] + "[]":
            data0 = "jobjectArray par" + str(num) + " = getStringArray(env,\"" + source[2] + "\");"
            list.append(data0)
            list.append(", par" + str(num))
            list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
            num = num + 1
            return list, num

    if "onLocationChanged" in taintpath and types == "double":
        data0 = "jdouble par" + str(num) + " = 28.685;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif "onLocationChanged" in taintpath and types == "float":
        data0 = "jfloat par" + str(num) + " = 28.685;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif "getSubscriberId" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 15;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
        return list, num
    elif ("getDeviceId" in taintpath or "toString" in taintpath or "toByteArray" in taintpath
          or "obtainMessage" in taintpath) and types == "byte[]":
        data0 = "jbyte par" + str(num) + "[16] = {3,5,8,2,4,0,0,5,1,1,1,1,1,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "short[]":
        data0 = "jshort par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10] = {1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
        return list, num
    elif "read" in taintpath and types == "int":
        data0 = "jint par" + str(num) + " = 512;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
        return list, num

    # if types in ["Context", "Handler", "Bundle", "Intent", "PendingIntent", "Object"]:
    if types in "Context":
        data0 = "jobject par" + str(num) + " = getGlobalContext(env);"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "int":
        data0 = "jint par" + str(num) + " = 0;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "long":
        data0 = "jlong par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "byte":
        data0 = "jbyte par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "boolean":
        data0 = "jboolean par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "short":
        data0 = "jshort par" + str(num) + " = 1;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "char":
        data0 = "jchar par" + str(num) + " = '0';"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "float":
        data0 = "jfloat par" + str(num) + " = 3.14;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "double":
        data0 = "jdouble par" + str(num) + " = 3.14;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("")
        num = num + 1
    elif types == "int[]":
        data0 = "jint par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "long[]":
        data0 = "jlong par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "byte[]":
        data0 = "jbyte par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "boolean[]":
        data0 = "jboolean par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "short[]":
        data0 = "jshort par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "char[]":
        data0 = "jchar par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "float[]":
        data0 = "jfloat par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "double[]":
        data0 = "jdouble par" + str(num) + "[10]={1,0,1,0,1,0,1,0,1,0};"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    elif types == "java.lang.String":
        data = line.split(", ")[1].split(":")[1]
        data0 = "jstring par" + str(num) + " = (*env)->NewStringUTF(env,\"" + data + "\");"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
    else:
        data0 = "jobject par" + str(num) + " = NULL;"
        list.append(data0)
        list.append(", par" + str(num))
        list.append("(*env)->DeleteLocalRef(env, par" + str(num) + ");")
        num = num + 1
        save_file(out_path, " [+]" + apkname + " the complex type is taint")
    return list, num
