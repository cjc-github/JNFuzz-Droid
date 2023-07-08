if [ "$1" = "x86" ]; then
  echo "  [-] build x86 spsc"
  compiler_prefix="${STANDALONE_TOOLCHAIN_PATH_x86}/bin/"
  if [ -z ${CC} ]; then
      export CC=i686-linux-android-gcc
  fi
elif [ "$1" = "x86_64" ]; then
    echo "  [-] build x86_64 spsc"
  compiler_prefix="${STANDALONE_TOOLCHAIN_PATH_x86_64}/bin/"
  if [ -z ${CC} ]; then
      export CC=x86_64-linux-android-gcc
  fi
elif [ "$1" = "armeabi" -o "$1" = "armeabi-v7a" ]; then
    echo "  [-] build arm spsc"
  compiler_prefix="${STANDALONE_TOOLCHAIN_PATH_arm}/bin/"
  if [ -z ${CC} ]; then
      export CC=arm-linux-androideabi-gcc
  fi
elif [ "$1" = "arm64-v8a" ]; then
    echo "  [-] build arm64 spsc"
  compiler_prefix="${STANDALONE_TOOLCHAIN_PATH_arm64}/bin/"
  if [ -z ${CC} ]; then
      export CC=aarch64-linux-android-gcc
  fi
else
    echo " [*] usage: ./build.sh arch[x86, x86_64, armeabi, armeabi-v7a, arm64-v8a]"
    exit
fi

echo " [+] Building the spsc library"
${compiler_prefix}${CC} -Wpedantic -Wall -O3 -g -MMD -o spsc.o -c spsc.c
ar rv libspsc.a spsc.o
rm -f *.o *.d
echo " [+] All done. Enjoy!"
