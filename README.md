JNFuzz-Droid: a lightweight automated fuzz testing and taint analysis framework for native code.

# Getting started

**requirements**

Before using JNFuzz-Droid, you must finish the following requirements:

+ Install Amandroid or JN-SAF for static taint analysis
+ JDK 1.8+ and python3.8
+ install jucify for symbolic execution
+ a real-world devices or emulator
+ The Frida tool has been configured on mobile devices and PC.

**Using the tool**

```
python3 main.py options -i <apk_folder> -o <out_folder> [-a] [-f] ...
```

options:

+ `-i apk_folder` : The path to the apk folder
+ `-o out_folder` : The path for apk out folder
+ `-a` : perform Amandroid static analysis
+ `-f` : perform FlowDroid static analysis
+ `-arch [armeabi|armeabi-v7a|arm64-v8a|x86|x86_64]` : Specified cpu architecture
+ `-h` : display the help
+ `-r` : remove some information to save memory space
+ `-st time`: static analysis time (s)
+ `-t time` : fuzzing time (s)
+ `-d`: display the process execution on another terminal, default no launch other terminal



**scirpts**

```
./JNFuzz-Droid.sh
```



# Sample

```
python3 main.py -i apk -o out -a
```

The input directory as follows:

```
native_leak.apk
```

The output directory structure is roughly as follows:

```
out
├── Data
│   └── native_leak
│       └── result
│          └── AppData.txt   # Results of Amandroid analysis
├── Dmethods
│   └── native_leak_Dmethods # Symbolic execution is used to save dynamic registration
├── IDDGs
│   └── native_leak.txt # Amandroid generates Inter-procedural Data Dependence Graph
├── outcome
│   └── native_leak
│       └── server1.cpp # server code for fuzzing
├── decompile
│   └── native_leak
│       └── xxxp # using apktool to decompile the native_leak.apk
├── report
│   └── native_leak.txt # Collect the native methods
├── taint_path
│   └── native_leak_taintpath.txt # Collect the taintpath
├── scripts
│   └── native_leak
│       └── script_1.txt # Save RS algorithm to generate JNIScript
└── static_exec_time.txt # The execution time of static analysis
└── report.txt # warning.log
```

In the same directory as out, there is also the `apk_outcome.txt` file, which stores the overall taint path. In addition, the `jnfuzz-droid.log` stores the run logs.

The <b>Taint Path</b> is:

```
native_leak script_1.txt Taint Path:
['getDeviceId:()Ljava/lang/String;', 'Lorg/arguslab/native_leak/MainActivity;.send:(Ljava/lang/String;)V[1]', 'JNIEnv->GetStringUTFChars[1]', '__android_log_print[2]']
```

