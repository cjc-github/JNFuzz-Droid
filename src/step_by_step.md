# Steps to Execute JNFuzzDroid

## Step 1: 

```bash
workon jucify_py38
```


<br/>

## Step 2:

```bash
python3 Preprocess.py apk/native_leak.apk out1 true

Parameter description:
1. The first parameter is the path to the APK being tested.
2. The second parameter is the output directory.
3. The third parameter is set to true, it will remove the unsatisfactory apk and the associated directory.
```

<br/>


The directory structure after executing the command:

```bash
$ tree -L 3
.
├── decompile # decompile via apktool
│   └── native_leak
│       ├── AndroidManifest.xml
│       ├── apktool.yml
│       ├── lib
│       ├── original
│       ├── res
│       └── smali
└── report # analysis result 
    └── native_leak.txt
```

The `decompile` directory is used for the decompiled APK files, while the `report` directory contains data about the native code within the APK.

The contents of `native_leak.txt` are as follows:

```bash
[apk]
name = apk/native_leak.apk
so_files = out1/decompile/native_leak/lib/armeabi-v7a/libleak.so,out1/decompile/native_leak/lib/arm64-v8a/libleak.so,out1/decompile/native_leak/lib/armeabi/libleak.so
native_activities = 
native_method = Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V 1
```


- `name` : indicates the name of the APK.
- `so_files` : lists the shared object libraries (SO files) present in the APK.
- `native_activities` : is used to determine if there are any native activities.
- `native_method` : specifies the signature of a native method, where the 1 indicates it is static, and 0 would indicate it is not static.


<br/>


## Step 3:

```bash
python3 Continue_process.py apk/native_leak.apk out1 90 true

Parameter description:
1. The first parameter is the path to the APK being tested.
2. The second parameter is the output directory.
3. The third parameter represents the maximum time allowed for static taint analysis.
4. The four parameter is set to true, it will remove the unsatisfactory apk and the associated directory.
```

<br/>


The directory structure after executing the command:

```bash
test@test:~/workspace/pycharm/JNFuzz-Droid/src/out1$ tree -L 3
.
├── Data
│   └── native_leak # static taint analysis using amandroid
│       ├── AndroidManifest.xml
│       ├── apktool.yml
│       ├── classes.dex
│       ├── lib
│       ├── original
│       ├── res
│       ├── result # static taint analysis result
│       ├── src
│       └── third_party_libs.txt
├── decompile # From Step 2
│   └── native_leak
│       ├── AndroidManifest.xml
│       ├── apktool.yml
│       ├── lib
│       ├── original
│       ├── res
│       └── smali
├── Dmethods # obtain the dynamic registration of native functions base nativedsicloser [from jucify]
│   └── native_leak_Dmethods
├── IDDGs # obtain the Inter-procedural Data Dependence Graph using amandroid
│   └── native_leak.txt
├── report # From Step 2
│   └── native_leak.txt
├── scripts # generate the script for target native method
│   └── native_leak
│       └── script_1.txt
├── static_exec_time.txt # the time taken for static taint analysis 
└── taint_path # the taint path for static taint analysis
    └── native_leak_taintpath.txt

```


<br/>

## Step 4:

```bash
python Fuzz_and_taint_analysis.py apk/native_leak.apk out1 armeabi false 10

Parameter description:
1. The first parameter is the path to the APK being tested.
2. The second parameter is the output directory.
3. The third parameter specifies the CPU architecture.
4. The fourth parameter indicates whether to execute only once.
5. The fifth parameter specifies the duration of the fuzz testing in seconds.
6. The sixth parameter determines whether to expand other terminals to run additional commands.
```

<br/>

## Step 5:


```
Traceback (most recent call last):
  File "utils/run_hook_script.py", line 199, in <module>
    devices = frida.get_usb_device()
  File "/home/test/.virtualenvs/jucify_py38/lib/python3.8/site-packages/frida/__init__.py", line 89, in get_usb_device
    return get_device_matching(lambda d: d.type == 'usb', timeout, **kwargs)
  File "/home/test/.virtualenvs/jucify_py38/lib/python3.8/site-packages/frida/__init__.py", line 97, in get_device_matching
    return get_device_manager().get_device_matching(predicate, timeout, **kwargs)
  File "/home/test/.virtualenvs/jucify_py38/lib/python3.8/site-packages/frida/core.py", line 26, in wrapper
    return f(*args, **kwargs)
  File "/home/test/.virtualenvs/jucify_py38/lib/python3.8/site-packages/frida/core.py", line 58, in get_device_matching
    return Device(self._impl.get_device_matching(lambda d: predicate(Device(d)), raw_timeout))
frida.InvalidArgumentError: device not found
```