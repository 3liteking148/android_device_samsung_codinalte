#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
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

# Inherit CM common Phone stuff.
$(call inherit-product-if-exists, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/golden/golden.mk)

# Device identifier
PRODUCT_DEVICE := golden
PRODUCT_NAME := lineage_golden
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8190
PRODUCT_MANUFACTURER := samsung

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480


# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=goldenxx \
	TARGET_DEVICE=golden \
	BUILD_FINGERPRINT="samsung/goldenxx/golden:4.1.2/JZO54K/I8190XXAMJ3:user/release-keys" \
	PRIVATE_BUILD_DESC="goldenxx-user 4.1.2 JZO54K I8190XXAMJ3 release-keys"
