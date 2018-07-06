#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
# Copyright (C) 2014 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
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
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# Use the Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Inherit the proprietary vendors blobs for all codinas.
$(call inherit-product-if-exists, vendor/samsung/golden/golden-vendor.mk)

#Releasetools
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/blobinstaller.sh:blobinstaller.sh \
#	$(LOCAL_PATH)/restorecon.sh:restorecon.sh

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.samsunggolden.rc:root/init.samsunggolden.rc \
    $(LOCAL_PATH)/rootdir/ueventd.samsunggolden.rc:root/ueventd.samsunggolden.rc \
    $(LOCAL_PATH)/rootdir/fstab.samsunggolden:root/fstab.samsunggolden \
    $(LOCAL_PATH)/rootdir/init.ste.rc:root/init.ste.rc \
    $(LOCAL_PATH)/rootdir/init.samsunggolden.usb.rc:root/init.samsunggolden.usb.rc
#    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc

# Recovery ramdisk, libraries and modules.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/rootdir/init.recovery.samsungcodina.rc:root/init.recovery.samsungcodina.rc \
    $(LOCAL_PATH)/recovery/rootdir/etc/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/rootdir/sbin/libkeyutils.so:recovery/root/sbin/libkeyutils.so \
    $(LOCAL_PATH)/recovery/rootdir/sbin/libsec_km.so:recovery/root/sbin/libsec_km.so \
    $(LOCAL_PATH)/recovery/rootdir/sbin/libsec_ecryptfs.so:recovery/root/sbin/libsec_ecryptfs.so 

# Inputs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Graphics
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/lib/egl/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    ro.zygote.disable_gl_preload=true \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    persist.sys.use_dithering=2 \
    persist.sys.strictmode.disable=1

# Ril
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/spn-conf.xml:system/etc/spn-conf.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/omxloaders:system/omxloaders \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ste.nmf.autoidle=1 \
    ste.video.dec.mpeg4.in.size=8192 \
    ste.video.enc.out.buffercnt=5 \
    ste.video.dec.recycle.delay=1 \
    ste.omx.ctx=0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bin/usbid_init.sh:system/bin/usbid_init.sh \

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.use-awesome=1

# Screen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.sf.display_rotation=0 \
    ro.lcd_brightness=170 \
    ro.lcd_min_brightness=30

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ste.cam.front.orientation=270 \
    ste.cam.back.orientation=90 \
    ste.cam.ext.cfg.path.secondary=/system/usr/share/camera/config_file/aptina_mt9v113.dat
# enable Snap
PRODUCT_PACKAGES += \
    Snap

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libnetcmdiface \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=150 \
    ro.wifihal.screenstate=0

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/ste_modem.sh:system/etc/ste_modem.sh \
    $(LOCAL_PATH)/configs/etc/cspsa.conf:system/etc/cspsa.conf

PRODUCT_PACKAGES += \
    libstlport \
    libjhead \
    libjhead_jni

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.ril_class=SamsungU8500RIL \
    ro.telephony.sends_barcount=1 \
    ro.telephony.default_network=0 \
    ro.telephony.ipasgatew=1


# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sirfgps.conf:system/etc/sirfgps.conf \
    $(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/etc/asound.conf:system/etc/asound.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default 

# Enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    ste.special_fast_dormancy=false

# Charger
# Charger Prebuilt (temporary solution for lollipop)
# Use prebuilt charger and images from KitKat
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/charger/charger:root/sbin/charger \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_0.png:root/res/images/charger/battery_0.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_1.png:root/res/images/charger/battery_1.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_2.png:root/res/images/charger/battery_2.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_3.png:root/res/images/charger/battery_3.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_4.png:root/res/images/charger/battery_4.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_5.png:root/res/images/charger/battery_5.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_charge.png:root/res/images/charger/battery_charge.png \
#    $(LOCAL_PATH)/prebuilt/charger/images/battery_fail.png:root/res/images/charger/battery_fail.png \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Hardware repo
$(call inherit-product, hardware/u8500/Android.mk)

PRODUCT_PACKAGES += \
    gralloc.montblanc \
    hwcomposer.montblanc \
    copybit.montblanc \
    libstelpcutils \
    libste_omxil-interface \
    libnmf \
    libasound \
    lights.montblanc \
    power.montblanc \
    libblt_hw \
    libomxil-bellagio \
    camera.montblanc \
    gps.montblanc \
    libsecril-shim
