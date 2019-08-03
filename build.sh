#!/bin/bash
LIBSODIUM_TAG=${LIBSODIUM_TAG:="1.0.18"}
_TARGET_ARCH=${TARGET_ARCH:="x86_64"}
TARGET_PLATFORM=${TARGET_PLATFORM:="android-21"}
NDK_PLATFORM=${TARGET_PLATFORM}

export _TARGET_ARCH

## Some sanity checks
## get libsodium source
[ ! -d libsodium ] && echo "Cloning libsodium" && git clone https://github.com/jedisct1/libsodium.git
cd libsodium && git checkout ${LIBSODIUM_TAG} > /dev/null 2>&1 && cd - > /dev/null
## Check on based arguments
[ ! -e libsodium/dist-build/android-${_TARGET_ARCH}.sh ] && echo "Unknown TARGET_ARCH ${_TARGET_ARCH} set" && exit 1
[ -z ${ANDROID_NDK_HOME} ] && echo "Please export your NDK installation home as ANDROID_NDK_HOME" && exit 1
export PATH=${PATH}:${ANDROID_NDK_HOME}/build
[ -z $(which ndk-build) ] && echo "ndk-build not found in PATH" && exit 1

echo "Building libsodium"
cd libsodium
./autogen.sh > /dev/null
NDK_PLATFORM=${TARGET_PLATFORM} TARGET_PLATFORM=${TARGET_PLATFORM} TARGET_ARCH=${TARGET_ARCH} \
    ARCH=${TARGET_ARCH} HOST_COMPILER=x86_64-linux-android "$(pwd)/dist-build/android-build.sh"
cd - > /dev/null
echo "Building hashkitten"
cd hashkitten
export NDK_PROJECT_PATH=.
ndk-build NDK_APPLICATION_MK=Application.mk
cd - > /dev/null
echo "Done. Enjoy!"