# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Device path
DEVICE_PATH := device/motorola/rhodei/rootdir

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420

# SurfaceFlinger offesets
PRODUCT_VENDOR_PROPERTIES += \
	ro.surface_flinger.set_idle_timer_ms=250 \
	ro.surface_flinger.set_touch_timer_ms=200 \
	ro.surface_flinger.use_color_management=true \
	ro.surface_flinger.use_content_detection_for_refresh_rate=true \
	ro.surface_flinger.use_smart_90_for_video=true \
	ro.surface_flinger.wcg_composition_dataspace=143261696 \
	zygote.critical_window.minute=10 \
	DEVICE_PROVISIONED=1

# Radio props from stock
PRODUCT_VENDOR_PROPERTIES += \
	persist.vendor.radio.force_get_pref=1 \
	persist.vendor.radio.dfr_mode_set=1 \
	persist.vendor.radio.custom_ecc=1 \
	persist.radio.multisim.config=dsds \
	persist.vendor.ssr.restart_level=ALL_ENABLE

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
USE_DEX2OAT_DEBUG := false

# Game Dashboard
ENABLE_GAMETOOLS := true

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/vendor/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device Init
PRODUCT_PACKAGES += \
    fstab.qcom.vendor_ramdisk \
    fstab.qcom

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_FOCAL_FINGERPRINT := true

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# Modules
BOOT_KERNEL_MODULES := \
    sm5602_fg_mmi.ko \
    sgm4154x_charger.ko \
    bq2589x_charger.ko \
    tcpc_sgm7220.ko \
    rt_pd_manager.ko \
    ili9882_mmi.ko \
    nova_0flash_mmi.ko

# Power
TARGET_IS_BLAIR := true

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/thermal-engine-rhodei.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-rhodei.conf

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/rhodei/rhodei-vendor.mk)
