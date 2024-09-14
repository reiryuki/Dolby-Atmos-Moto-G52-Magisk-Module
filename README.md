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
- libswvqe.so: https://dumps.tadiphone.dev/dumps/redmi/alioth qssi-user-12-SKQ1.211006.001-V13.0.3.0.SKHEUXM-release-keys
- libhidlbase.so: CrDroid ROM Android 13
- android.hardware.audio.effect@*-impl.so: https://dumps.tadiphone.dev/dumps/oneplus/op594dl1 qssi-user-14-UKQ1.230924.001-1701915639192-release-keys--US
- libmagiskpolicy.so: Kitsune Mask R65C33E4F

## Screenshots
- https://t.me/androidryukimodsdiscussions/108103

## Requirements
- ARM64 architecture
- Android 11 (SDK 30) and up
- Magisk or KernelSU installed (Recommended to use Magisk Delta/Kitsune Mask for systemless early init mount manifest.xml if your ROM is Read-Only https://t.me/androidryukimodsdiscussions/100091)
- Moto Core Magisk Module installed https://github.com/reiryuki/Moto-Core-Magisk-Module except you are in Motorola ROM

## WARNING!!!
- Possibility of bootloop or even softbrick or a service failure on Read-Only ROM if you don't use Magisk Delta/Kitsune Mask.

## Installation Guide & Download Link
- Recommended to use Magisk Delta/Kitsune Mask https://t.me/androidryukimodsdiscussions/100091
- Remove any other else Dolby Magisk module with different name (no need to remove if it's the same name)
- Reboot
- Install Moto Core Magisk Module first: https://github.com/reiryuki/Moto-Core-Magisk-Module except you are in Motorola ROM
- If you have Dolby in-built in your ROM, then you need to activate data.cleanup=1 at the first time install (READ Optionals bellow!)
- Install this module https://www.pling.com/p/1908400/ via Magisk app or KernelSU app or Recovery if Magisk installed
- Install AML Magisk Module https://t.me/androidryukimodsdiscussions/29836 only if using any other else audio mod module
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings
- Reboot
- If you are using KernelSU, you need to allow superuser list manually all package name listed in package.txt (and your home launcher app also) (enable show system apps) and reboot afterwards
- If you are using SUList, you need to allow list manually your home launcher app (enable show system apps) and reboot afterwards
- If options doesn't show up in Bluetooth audio, try disconnect and reconnect the Bluetooth and restart the app
- If you have sensors issue (fingerprint, proximity, gyroscope, etc), then READ Optionals bellow!

## Optionals
- https://t.me/ryukinotes/8
- Global: https://t.me/androidryukimodsdiscussions/60861
- Stream: https://t.me/androidryukimodsdiscussions/26764

## Troubleshootings
- https://t.me/ryukinotes/10
- https://t.me/ryukinotes/11
- Global: https://t.me/androidryukimodsdiscussions/29836

## Support & Bug Report
- https://t.me/androidryukimodsdiscussions/2618
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/viperatmos
- https://t.me/androidryukimodsdiscussions
- @HELLBOY017
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/ryukinotes/25


