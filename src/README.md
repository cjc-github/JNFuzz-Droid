How to use the JNFuzz-Droid?

### 一、install jdk

jdk version: 1.8.0_261

### 二、Installing python dependencies

```
sudo apt install python3-pip
pip install psutil
sudo apt install adb
sudo apt-get install graphviz libgraphviz-dev

# configuration virtualenv
pip install virtualenv
pip install virtualenvwrapper
```

sudo gedit ~/.bashrc

```
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv
source /home/test/.local/bin/virtualenvwrapper.sh
```

source ~/.bashrc

mkvirtualenv -p /usr/bin/python3.8 jucify_py38



pip install -r requirements.txt 

```
requirements.txt 

angr==8.20.7.6
androguard==3.3.5
pygraphviz
```



### 三、Cross compilation
First, download the Android NDK. You can visit it via NDK website link or other IDE tools (e.g., AndroidStudio).

Here, we download the NDK 21.3.652817 via **AndroidStudio**.

```
https://developer.android.com/ndk/downloads
https://dl.google.com/android/repository/android-ndk-r21d-linux-x86_64.zip
```

Then, unzip it and build the standalone-toolchain For x86_64 standalone-toolchain

```
unzip android-ndk-r21-linux-x86_64.zip
cd android-ndk-r21/

./build/tools/make-standalone-toolchain.sh --arch=arm --platform=21 --install-dir=../android-standalone-toolchain-arm
./build/tools/make-standalone-toolchain.sh --arch=x86 --platform=21 --install-dir=../android-standalone-toolchain-x86
./build/tools/make-standalone-toolchain.sh --arch=x86_64 --platform=21 --install-dir=../android-standalone-toolchain-x86_64
./build/tools/make-standalone-toolchain.sh --arch=arm64 --platform=21 --install-dir=../android-standalone-toolchain-arm64
```
Last, it will generate the path of standalone-toolchain.


Finally, change toolchain environment as follows:

```
export NDK_HOME=~/Android/Sdk/ndk/21.1.6352462
export PATH=$PATH:$NDK_HOME
export STANDALONE_TOOLCHAIN_PATH_x86=~/Android/Sdk/ndk/android-standalone-toolchain-x86
export STANDALONE_TOOLCHAIN_PATH_x86_64=~/Android/Sdk/ndk/android-standalone-toolchain-x86_64
export STANDALONE_TOOLCHAIN_PATH_arm=~/Android/Sdk/ndk/android-standalone-toolchain-arm
export STANDALONE_TOOLCHAIN_PATH_arm64=~/Android/Sdk/ndk/android-standalone-toolchain-arm64
```

### 四、Frida

First install frida

```
pip install frida==15.1.22
```



# Perform JNFuzz-Droid:

```
workon jucify

python3 main.py -i apk -o out -a
```

