DEVICE_PATH := device/unihertz/gargoyle
#TWRP_EVENT_LOGGING := true

#Titan Specific for UFS and EMMC build
DEVICE_ARCH_EMMC = true

ifdef DEVICE_ARCH_EMMC
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/emmc/kernel.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/emmc/dtbo.img
else
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/ufs/kernel.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/ufs/dtbo.img
endif

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1

# Uniherz Titan options
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TW_INPUT_BLACKLIST := "mtk-pad"

# Security bypass options
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_SDK_VERSION := 28
#PRODUCT_SHIPPING_API_LEVEL := 28

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := mt6771
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := mt6771

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --pagesize 2048 --base 0x40078000 --kernel_offset 0x00008000 --ramdisk_offset 0x14f88000 --second_offset 0x00e88000 --tags_offset 0x13f88000

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x2000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xc0000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x1b000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0xc0000000

# USB Mounting
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_REAL_SDCARD := false

# TWRP-Specific
BOARD_SUPPRESS_SECURE_ERASE := true
#BOARD_SUPPRESS_EMMC_WIPE := true
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1440x1440
DEVICE_SCREEN_WIDTH := 1440
DEVICE_SCREEN_HEIGHT := 1440
#RECOVERY_GRAPHICS_USE_LINELENGTH := true

#TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_INTERNAL_STORAGE_PATH := "/data/media/0"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/sdcard"
#TW_EXTERNAL_STORAGE_MOUNT_POINT :="sdcard"
#RECOVERY_SDCARD_ON_DATA := true

# Crypto
TW_INCLUDE_CRYPTO := true
#TW_CRYPTO_USE_SYSTEM_VOLD := true
#TW_CRYPTO_SYSTEM_VOLD_MOUNT := vendor
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true

TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 128
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_EXCLUDE_SUPERSU := true
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true

#Additional flags
TW_USE_TOOLBOX := true
#TW_FLASH_FROM_STORAGE := true
#TW_NEW_ION_HEAP := true
#TWHAVE_SELINUX := true

# Screenshots
TW_INCLUDE_FB2PNG := true

# MTP
# TW_EXCLUDE_MTP := true
#TW_MTP_DEVICE := "/dev/mtp_usb"

# USB Storage
#TW_NO_USB_STORAGE := false

# Logs
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Neon
#ARCH_ARM_HAVE_NEON := true

# Exclude APP
TW_EXCLUDE_TWRPAPP := true

# Backup data/media
#TW_BACKUP_DATA_MEDIA := true

#TW_INCLUDE_FBE := true

# AVB
#BOARD_AVB_ENABLE := true
#BOARD_BUILD_DISABLED_VBMETAIMAGE := false
