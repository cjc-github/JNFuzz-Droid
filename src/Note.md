# Note

Due to the JNFuzz-Droid packaged zip file exceeding Github's upload limit of 100M, we had to exclude certain large files from the zip file.
These files, such as apktool, jucify, and frida-server, are essential for the successful operation of JNFuzz-Droid.
Therefore, it is necessary to manually copy these files into the JNFuzz-Droid.zip in order for it to function properly.

command:

```
cp -r extras/frida-server JNFuzz-Droid/lib/
cp extras/apktool_2.6.1.jar JNFuzz-Droid/lib/
cp extras/argus-saf.jar JNFuzz-Droid/lib/
cp extras/JuCify-0.1-jar-with-dependencies.jar JNFuzz-Droid/lib/
cp extras/soot-infoflow-cmd-jar-with-dependencies.jar JNFuzz-Droid/lib/
```
