# Just a demo

## Purpose

Build a statically linked console app for Android (in this case for android-21 API level) which does
take all arguments from CLI and hash them using [libsodium's generic hash](https://download.libsodium.org/doc/hashing/generic_hashing).
Results will be written to STDOUT.

The resulting app will be call __hashkitten__.

## Prerequisites

* NDK
* git
* bash

## Build

Go to checkout folder and run

```sh
ANDROID_NDK_HOME=<path to your NDK> ./build.sh
```

per default the app is build for __x86_64__ and __android-21__, if you want to alter these settings
you may want to have a look into **build.sh**

## Deploy fragments

Can be found at __hashkitten/libs/\<arch\>/hashkitten__.

You can run it via **adb**

## Testing

A collection of tests can be found at hashkitten/tests.
To run the tests

* push all files to the device
* make sure __hashkitten__ is in PATH
* run **run_tests.sh**

## Release tested with

* NDK r-20
* libsodium 1.0.18
* Ubuntu 18.04 x86_64
* Emulated device
* adb

Emulated device had the following settings

```text
Name: 4.7_WXGA_API_22
CPU/ABI: Intel Atom (x86_64)
Target: default [] (API level 21)
Skin: 720x1280
SD Card: 512 MB
fastboot.chosenSnapshotFile: 
runtime.network.speed: full
hw.accelerometer: yes
hw.device.name: 4.7in WXGA
hw.lcd.width: 1280
hw.initialOrientation: Portrait
image.androidVersion.api: 21
tag.id: default
hw.mainKeys: yes
hw.camera.front: emulated
avd.ini.displayname: 4.7  WXGA API 22
hw.gpu.mode: auto
hw.ramSize: 512
PlayStore.enabled: false
fastboot.forceColdBoot: no
hw.cpu.ncore: 2
hw.keyboard: yes
hw.sensors.proximity: yes
hw.dPad: no
hw.lcd.height: 720
vm.heapSize: 80
skin.dynamic: yes
hw.device.manufacturer: Generic
hw.gps: yes
hw.audioInput: yes
image.sysdir.1: system-images\android-21\default\x86_64\
showDeviceFrame: yes
hw.camera.back: virtualscene
AvdId: 4.7_WXGA_API_22
hw.lcd.density: 320
hw.arc: false
hw.device.hash2: MD5:d6fc76a779257600915fd05479951444
fastboot.forceChosenSnapshotBoot: no
fastboot.forceFastBoot: yes
hw.trackBall: no
hw.battery: yes
hw.sdCard: yes
tag.display: 
runtime.network.latency: none
disk.dataPartition.size: 800M
hw.sensors.orientation: yes
avd.ini.encoding: UTF-8
hw.gpu.enabled: yes
```

## License

As we statically link libsodium, license is the same as libsodium.

## Collaboration

As this is just a demo there is no way you can collaborate on this here.
All merged requests and issues will be ignored.

Don't expect any further development on this project
