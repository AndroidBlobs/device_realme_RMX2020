#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9cef1bd3ff6f476522c6bdfa09493a969a3dcf25; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:f2e6d1d6642668d5941c37e139129c1d19a1b05b \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9cef1bd3ff6f476522c6bdfa09493a969a3dcf25 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
