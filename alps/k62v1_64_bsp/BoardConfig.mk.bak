#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/alps/k62v1_64_bsp

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B (动态分区通常启用A/B)
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    system \
    product \
    system_ext \
    vendor \
    vbmeta_system \
    vbmeta_vendor
BOARD_USES_RECOVERY_AS_BOOT := true  # 无独立recovery分区，用boot作为recovery

# Architecture (MTK6762为Cortex-A53架构，arm64)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k62v1_64_bsp
TARGET_NO_BOOTLOADER := true

# Display (1280x720 HD屏，密度设为300适配)
TARGET_SCREEN_DENSITY := 300
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Kernel (MTK6762内核配置)
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := k62v1_64_bsp_defconfig
TARGET_KERNEL_SOURCE := kernel/alps/k62v1_64_bsp

# Kernel - prebuilt (若使用预编译内核)
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
endif

# Partitions (动态分区配置，无独立recovery分区)
BOARD_FLASH_BLOCK_SIZE := 131072  # 2048*64
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432  # 32MB (32*1024*1024)
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# 动态分区核心配置 (从设备scatter.txt或/proc/partinfo获取真实值替换！)
BOARD_SUPER_PARTITION_SIZE := 9126805504  # 示例值，需校准
BOARD_SUPER_PARTITION_GROUPS := alps_dynamic_partitions
BOARD_ALPS_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_ALPS_DYNAMIC_PARTITIONS_SIZE := 9122611200  # 示例值，需校准

# Platform (MTK6762对应平台名)
TARGET_BOARD_PLATFORM := mt6762

# Recovery (动态分区无独立recovery，依赖BOARD_USES_RECOVERY_AS_BOOT)
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level (设置真实日期，从设备系统查看)
VENDOR_SECURITY_PATCH := 2024-08-05

# Verified Boot (AVB验证已关闭，禁用AVB)
BOARD_AVB_ENABLE := false  # 关闭AVB验证
# BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3  # 已禁用，删除此行

# TWRP Configuration (常用功能+默认中文+下载模式支持)
TW_THEME := portrait_hdpi  # 适配720p竖屏
TW_DEFAULT_LANGUAGE := zh_CN  # 默认中文
TW_EXTRA_LANGUAGES := true  # 保留多语言支持
TW_SCREEN_BLANK_ON_BOOT := true  # 启动时黑屏减少闪烁
TW_INPUT_BLACKLIST := "hbtp_vm"  # 屏蔽指定输入设备
TW_USE_TOOLBOX := true  # 使用toolbox替代busybox
TW_INCLUDE_REPACKTOOLS := true  # 支持刷机包重打包

# 常用功能开关 (明确常用且无风险)
TW_INCLUDE_CRYPTO := true  # 支持加密存储解密
TW_SUPPORT_FSCRYPT := true  # 支持fscrypt文件系统加密
TW_INCLUDE_REBOOT_MENU := true  # 显示重启菜单（含Recovery/Download模式）
TW_INCLUDE_SHUTDOWN := true  # 显示关机选项
TW_BACKUP_METHOD := tar  # 使用tar格式备份（兼容性好）
TW_INCLUDE_NTFS_3G := true  # 支持NTFS格式U盘
TW_INCLUDE_FUSE_EXFAT := true  # 支持exFAT格式U盘

# 下载模式支持 (MTK设备通过reboot edl进入EDL/下载模式)
TW_REBOOT_MENU_ITEMS := reboot,recovery,download,bootloader  # 显式定义菜单项（含download）
TW_REBOOT_DOWNLOAD_CMD := reboot\ edl  # 进入下载模式的命令（空格转义为\ ）
TW_ENABLE_EDL_REBOOT := true  # 启用EDL重启选项
