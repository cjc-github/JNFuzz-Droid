# How to use the JNFuzz-Droid?

### 一、Install jdk

Please ensure that JDK is installed on your machine. While this project recommends JDK version 1.8 or above to execute **FlowDroid** and **Amandroid**.



The jdk version that the project is running is: `1.8.0_261`



**verify JDK installation:**

```bash
java -version
```

### 二、Installing python dependencies

1、 Ensure that Python 3 and pip are installed on your system.

```bash
# install python and pip
sudo apt update  
sudo apt install python3 python3-pip

# some pip source, such as
https://pypi.tuna.tsinghua.edu.cn/simple/
https://pypi.mirrors.ustc.edu.cn/simple/
https://pypi.douban.com/simple/
http://mirrors.aliyun.com/pypi/simple/
```

2、install the python packages required by the project.

```bash
# install psutil and adb (Android Debug Bridge)
pip install psutil
sudo apt install adb
```

3、install Graphviz and its python bingdings

```bash
# install Graphviz and its python bingdings
sudo apt-get install graphviz libgraphviz-dev
```

4、configuration virtualenv

```bash
sudo pip install virtualenv
sudo pip install virtualenvwrapper
# Verify：Make sure the virtualenv and virtualenvwrapper.sh files are in the $Home/.local/bin directory
```

Then, edit your `~/.bashrc` file (or corresponding shell configuration file) and add the following lines to configure the virtual environment:

```bash
# open the ~/.bashrc configuration file
sudo gedit ~/.bashrc

# add the following lines to configure the virtual environment
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

# reload the configuration file
source ~/.bashrc
```

Last, create a new virtual environment named `jucify_py38` and specify Python 3.8 (ensure Python 3.8 is installed on your system):

```bash
mkvirtualenv -p /usr/bin/python3.8 jucify_py38
```

in virtual environment `jucify_py38`, need to install some python for install **jucify**

```bash
cd src/JNFuzz-Droid/Jucify/nativediscloser
pip install -r requirements.txt 

# requirements.txt context:
angr==8.20.7.6
androguard==3.3.5
pygraphviz

protobuf==3.19.0
```



### 三、Cross compilation
First, download the Android NDK. You can visit it via NDK website link or other IDE tools (e.g., AndroidStudio).



**Way1: NDK Website**

1、 we download the NDK 21.3.652817.

```bash
https://developer.android.com/ndk/downloads
https://dl.google.com/android/repository/android-ndk-r21d-linux-x86_64.zip
```

2、unzip it and build the standalone-toolchain for x86、ARM standalone-toolchain.

```bash
unzip android-ndk-r21-linux-x86_64.zip
cd android-ndk-r21/

./build/tools/make-standalone-toolchain.sh --arch=arm --platform=21 --install-dir=../android-standalone-toolchain-arm
./build/tools/make-standalone-toolchain.sh --arch=x86 --platform=21 --install-dir=../android-standalone-toolchain-x86
./build/tools/make-standalone-toolchain.sh --arch=x86_64 --platform=21 --install-dir=../android-standalone-toolchain-x86_64
./build/tools/make-standalone-toolchain.sh --arch=arm64 --platform=21 --install-dir=../android-standalone-toolchain-arm64
```
Last, it will generate the path of standalone-toolchain.

3、 change toolchain environment as follows.

```bash
# open the ~/.bashrc configuration file
sudo gedit ~/.bashrc

# add the following lines to configure the android standalone toolchain
export NDK_HOME=$android-ndk-r21/
export PATH=$PATH:$NDK_HOME
export STANDALONE_TOOLCHAIN_PATH_x86=$android-ndk-r21/android-standalone-toolchain-x86
export STANDALONE_TOOLCHAIN_PATH_x86_64=$android-ndk-r21/android-standalone-toolchain-x86_64
export STANDALONE_TOOLCHAIN_PATH_arm=$android-ndk-r21/android-standalone-toolchain-arm
export STANDALONE_TOOLCHAIN_PATH_arm64=$android-ndk-r21/android-standalone-toolchain-arm64

# reload the configuration file
source ~/.bashrc
```



**Way2: (AndroidStudio, recommed and we use it.)**

1、download the NDK 21.3.652817 via **AndroidStudio**.

2、unzip it and build the standalone-toolchain for x86、ARM standalone-toolchain.

```bash
cd $HOME/Android/Sdk/ndk/21.3.6528147/

./build/tools/make-standalone-toolchain.sh --arch=arm --platform=21 --install-dir=../android-standalone-toolchain-arm
./build/tools/make-standalone-toolchain.sh --arch=x86 --platform=21 --install-dir=../android-standalone-toolchain-x86
./build/tools/make-standalone-toolchain.sh --arch=x86_64 --platform=21 --install-dir=../android-standalone-toolchain-x86_64
./build/tools/make-standalone-toolchain.sh --arch=arm64 --platform=21 --install-dir=../android-standalone-toolchain-arm64
```

3、change toolchain environment as follows.

```bash
sudo gedit ~/.bashrc

export NDK_HOME=~/Android/Sdk/ndk/21.1.6352462
export PATH=$PATH:$NDK_HOME
export STANDALONE_TOOLCHAIN_PATH_x86=~/Android/Sdk/ndk/android-standalone-toolchain-x86
export STANDALONE_TOOLCHAIN_PATH_x86_64=~/Android/Sdk/ndk/android-standalone-toolchain-x86_64
export STANDALONE_TOOLCHAIN_PATH_arm=~/Android/Sdk/ndk/android-standalone-toolchain-arm
export STANDALONE_TOOLCHAIN_PATH_arm64=~/Android/Sdk/ndk/android-standalone-toolchain-arm64

source ~/.bashrc
```



### 四、Frida

1、 install frida.

```bash
pip install frida==15.1.22
```



**verify :**

In a python script or interactive environment, try importing your installed package. If "**ModuleNotFoundError**" does not appear, the package has been installed successfully.

```bash
python
>>> import frida

# Error import result：
Traceback (most recent call last):
	File "<stdin>", line 1, in <module>
ModuleNotFoundError: No moudle name 'frida'
```



2、Give some software (afl-fuzz、frida-server、client、server and so on) permission.

```bash
cd JNFuzz-Droid lib
sudo chmod -R +x ./

or 
cd JNFuzz-Droid
chmox 777 -R ./
```





# Perform JNFuzz-Droid:

```bash
workon jucify

python3 main.py -i apk -o out -a
```

