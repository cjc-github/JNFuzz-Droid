# Note

The size of the JNFuzz-Droid packaged zip file was over 100M due to exceeding Github's upload limit, so we did not include some of the large files in the packaged zip file.

These file include: apktool,jucify,frida-server files and so on.  


JNFuzz-Droid.zip requires a few files to be copied for it work successfully.


command:

```
cp -r extras/frida-server JNFuzz-Droid/lib/
cp extras/apktool_2.6.1.jar JNFuzz-Droid/lib/
cp extras/argus-saf.jar JNFuzz-Droid/lib/
cp extras/JuCify-0.1-jar-with-dependencies.jar JNFuzz-Droid/lib/
cp extras/soot-infoflow-cmd-jar-with-dependencies.jar JNFuzz-Droid/lib/
```
