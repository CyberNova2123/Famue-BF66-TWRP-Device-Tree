#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 继承基础产品配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

LOCAL_PATH := device/alps/k62v1_64_bsp

# A/B OTA后处理配置
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot Control HAL (动态分区A/B必备)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.mt6762 \
    bootctrl.mt6762.recovery \
    libgptutils \
    libz \
    libcutils

# OTA相关工具
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# 产品基础属性 (必须定义，用于构建识别)
PRODUCT_DEVICE := k62v1_64_bsp  # 设备代号
PRODUCT_NAME := twrp_k62v1_64_bsp  # TWRP产品名
PRODUCT_BRAND := alps  # 品牌
PRODUCT_MODEL := MT6762_Device  # 型号(可自定义)
PRODUCT_MANUFACTURER := ALPS  # 制造商
PRODUCT_LOCALES := zh_CN en_US  # 支持语言(中文优先)
