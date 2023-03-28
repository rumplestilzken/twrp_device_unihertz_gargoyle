TWRP 3.6.0_9 for Unihertz Titan (Android 10), semi-working alpha version v0.2
==============================================================

This is TWRP recovery for Unihertz Titan smartphone.

Known Issues:
    1. Userdata decryption
    2. MTP
    3. UFS based devices cannot mount any partitions

That means that you won't be able to access user data (only system, vendor and other internal partitions),
and transfer files over USB with MTP.

Yet, it's still useful for removing bloatware/google services or installing Magisk and obtaining root access.
ADB and file transfers (adb pull/push) work fine.

Use this TWRP version only if your really-REALLY want to install custom recovery and/or root.

# Installation

Method 1:

1. Allow OEM unlocking in Android developer settings (if you don't know what it is, search on the internet)
2. Boot to fastboot: power off the device, press VOL UP + POWER, you'll get into recovery, select "boot into bootloader". If you see "no command" screen, press VOL UP + POWER simultaneously multiple times, you'll eventually see the menu.
3. (skip this step if you already have unlocked bootloader) On the PC: fastboot flashing unlock
4. On the PC: fastboot flash recovery recovery.img
5. fastboot reboot
6. Press VOL UP right after rebooting, or the firmware would return stock recovery.

Method 2:

Use SP Flash Tool with stock Titan firmware, but select only "recovery" partition to update, using recovery.img as the boot file.
Bootloader should be unlocked (see above).

# Notes

I've tried by best to make decryption work but haven't succeeded. I guess the problem is in
TEE OS (TrustZone OS), it doesn't work correctly in TWRP for some reason. I've tried to start 'teed'
and it seems to run, but the decryption still hangs somewhere in binder request over socket.

# Compilation

To get started with OMNI sources to build TWRP, you'll need to get
familiar with [Git and Repo](https://source.android.com/source/using-repo.html).

To initialize your local repository using the OMNIROM trees to build TWRP, use a command like this:

    repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0

To initialize a shallow clone, which will save even more space, use a command like this:

    repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0

Then to sync up:

    repo sync


1. Copy 'device' to twrp directory
2. Apply `patches/0001-unihertz-titan.patch`
  1. Apply patch c713d76 if you run into a build issue surrounding "check_radio_versions"
  2. Apply patch 12b55e8 if you run into "'dict' object has no attribute 'iteritems'"
  3.*See https://github.com/TeamWin/Team-Win-Recovery-Project/issues/1589*
  4. If you run into issues about print statements, update your systems symlink from python3 to python2
3. Run `cherrypick.sh`
4. Build for a device with recovery partition:

    ```cd <source-dir>; export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch omni_gargoyle-eng; mka recoveryimage```

After that, execute

    ./avbtool.py append_vbmeta_image --image recovery.img --partition_size 33554432 --vbmeta_image vbmeta.img

# Contacts
rumplestilzken <rumplestilzken@gmail.com>

Credits to ValdikSS for his work. His wiki, which contains a ton of information, can be found at https://unihertz-titan.neocities.org/
