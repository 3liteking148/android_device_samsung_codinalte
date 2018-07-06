# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2014 Jonathan Jason Dennis [Meticulus] (theonejohnnyd@gmail.com)
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

"""Custom OTA commands for codina"""

import common
import os
import sys
import time

LOCAL_DIR = os.path.dirname(os.path.abspath(__file__))
TARGET_DIR = os.getenv('OUT')
UTILITIES_DIR = os.path.join(TARGET_DIR, 'symbols')

def addFolderToZip(info, directory, basedir):
    list = os.listdir(directory)
 
    for entity in list:
        each = os.path.join(directory,entity)
 
        if os.path.isfile(each):
            print "Adding vendor file -> "+ os.path.join(basedir, entity)
            info.output_zip.write(each, os.path.join(basedir, entity))
        else:
            addFolderToZip(info,each,os.path.join(basedir, entity))

def FullOTA_InstallEnd(info):
  
  # Symlink some dependencies of libcscall.so
 
  info.script.AppendExtra('symlink("/system/lib/ste_omxcomponents/libste_dec_amr.so", "/system/lib/libste_dec_amr.so");')
  info.script.AppendExtra('symlink("/system/lib/ste_omxcomponents/libste_enc_amr.so", "/system/lib/libste_enc_amr.so");')
  info.script.AppendExtra('symlink("/system/lib/ste_omxcomponents/libste_dec_amrwb.so", "/system/lib/libste_dec_amrwb.so");')
  info.script.AppendExtra('symlink("/system/lib/ste_omxcomponents/libste_enc_amrwb.so", "/system/lib/libste_enc_amrwb.so");')
