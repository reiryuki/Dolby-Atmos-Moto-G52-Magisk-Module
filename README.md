# Dolby Atmos Moto G52 Magisk Module

## DISCLAIMER
- Motorola & Dolby apps and blobs are owned by Motorola™ & Dolby™.
- The MIT license specified here is for the Magisk Module only, not for Motorola & Dolby apps and blobs.

## Descriptions
- Equalizer sound effect ported from Motorola Moto G52 (rhode) and integrated as a Magisk Module for all supported and rooted devices with Magisk
- Global type sound effect
- Doesn't support auxiliary cable
- Conflicted with `vendor.dolby_v3_6.hardware.dms360@2.0-service`, `vendor.dolby_sp.hardware.dmssp@2.0-service`, & `vendor.dolby.hardware.dms@1.0-service`

## Sources
- https://dumps.tadiphone.dev/dumps/motorola/rhode user-12-S1SR32.38-124-3-a8403-release-keys
- libsqlite.so: https://dumps.tadiphone.dev/dumps/zte/p855a01 msmnile-user-11-RKQ1.201221.002-20211215.223102-release-keys
- libswvqe.so: https://dumps.tadiphone.dev/dumps/redmi/alioth qssi-user-12-SKQ1.211006.001-V13.0.3.0.SKHEUXM-release-keys
- libhidlbase.so: CrDroid ROM Android 13
- libutils.so: LineageOS 23 Android 16 BP2A.250605.031.A2 1758630651
- android.hardware.audio.effect@*-impl.so: https://dumps.tadiphone.dev/dumps/oneplus/op594dl1 qssi-user-14-UKQ1.230924.001-1701915639192-release-keys--US
- libmagiskpolicy.so: Magisk (stable) 30.7 (30700)

## Screenshots
- https://t.me/androidryukimodsdiscussions/108103

## Changelog

v5.5
- Update libmagiskpolicy.so from Magisk (stable) 30.7 (30700) (fixes selinux denials in KernelSU)
- Does not disable raw playback (You can use Audio Compatibility Patch Reborn Magisk Module instead)

v5.4
- Fix wrong target in latest KernelSU
- Improve detections

v5.3
- Fix wrong manifest.xml location patch target in latest Magisk version

v5.2
- Tidy up aml.sh
- Exclude audioeffectshaptic.xml
- Fix wrong file permissions in some ROMs

v5.1
- Fix ZN7android8String16aSEOS0 function not found in some ROMs
- Add libutils.so as system_support
- Abort installation if fail to mount mirror system

v5.0
- Fix isAtLeast methods
- Fake Kitsune Mask detection
- Improve /odm and /my_product support detection

v4.9
- Fix script bug at installation for libsqlite.so detections
- Fix selinux denials

v4.8
- Modifies all blobs (if dolby.mod=1) to fix conflict with in-built Dolby

v4.7
- Fix BLUETOOTH_PRIVILEGED permission
- Add Action button to clear apps caches
- Fix architecture detection in some weird ROMs
- Fix bug in uninstall.sh

v4.6
- Fix missing/unaccessible libsqlite.so in some Android 15 ROMs

## Requirements
- arm64-v8a architecture
- Android 11 (SDK 30) and up
- HIDL audio service
- Magisk or Kitsune Mask or KernelSU or Apatch installed (Recommended to use Magisk Delta/Kitsune Mask for systemless early init mount manifest.xml if your ROM is Read-Only https://t.me/ryukinotes/49)
- Moto Core Magisk Module installed https://github.com/reiryuki/Moto-Core-Magisk-Module except you are in Motorola ROM

## WARNING!!!
- Possibility of bootloop or even softbrick or a service failure on Read-Only ROM if you don't use Magisk Delta/Kitsune Mask.

## Installation Guide & Download Link
- Recommended to use Magisk Delta/Kitsune Mask https://t.me/ryukinotes/49
- Remove any other else Dolby MAGISK MODULE with different name (no need to remove if it's the same name)
- Reboot
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs or https://github.com/KernelSU-Modules-Repo/magic_mount_rs or https://github.com/KernelSU-Modules-Repo/hybrid_mount first depending on ROM compatibility
- Install Moto Core Magisk Module first: https://github.com/reiryuki/Moto-Core-Magisk-Module except you are in Motorola ROM
- If you have Dolby in-built in your ROM, then you need to activate data.cleanup=1 at the first time install (READ Optionals bellow!)
- Install this module https://devuploads.com/4eo50db90jvp via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Install AML Magisk Module https://t.me/ryukinotes/34 only if using any other else audio mod module
- Reboot
- If you are using KernelSU, you need to allow superuser list manually all package name listed in package.txt (and your home launcher app also) (enable show system apps) and reboot afterwards
- If you are using SUList, you need to allow list manually your home launcher app (enable show system apps) and reboot afterwards
- If options doesn't show up in Bluetooth audio, try disconnect and reconnect the Bluetooth and restart the app
- If you have sensors issue (fingerprint, proximity, gyroscope, etc), then READ Optionals bellow!

## Optionals
- https://t.me/ryukinotes/8
- Global: https://t.me/ryukinotes/35
- Stream: https://t.me/ryukinotes/52

## Troubleshootings
- https://t.me/ryukinotes/10
- https://t.me/ryukinotes/11
- Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/viperatmos
- https://t.me/androidryukimodsdiscussions
- @HELLBOY017
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/ryukinotes/25


