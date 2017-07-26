#!/system/bin/sh
# Copyright (c) 2009-2015, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Update the panel color property and Leds brightness 
for i in $(seq 5); do
    if [ -f /sys/bus/i2c/devices/4-004a/panel_color ]; then
	# Atmel
	color=`cat /sys/bus/i2c/devices/4-004a/panel_color`
	if [ -n "$color" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_color successfully from 4-004a $color
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
	    sleep 1
	    continue
	fi
	#Synaptics
    elif [ -f /sys/bus/i2c/devices/4-0020/panel_color ]; then
	color=`cat /sys/bus/i2c/devices/4-0020/panel_color`
	if [ -n "$color" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_color successfully from 4-0020 $color
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
	    sleep 1
	    continue
	fi
	#Focal
    elif [ -f /sys/bus/i2c/devices/4-0038/panel_color ]; then
	color=`cat /sys/bus/i2c/devices/4-0038/panel_color`
	if [ -n "$color" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_color successfully from 4-0038 $color
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
	    sleep 1
	    continue
	fi
    else
	color="0"
	/system/bin/log -p i -t panel-info-sh Get panel_color unsuccessfully, try again...
	sleep 1
    fi
done

for i in $(seq 5); do
    if [ -f /sys/bus/i2c/devices/4-004a/panel_vendor ]; then
	# Atmel
	panel_vendor=`cat /sys/bus/i2c/devices/4-004a/panel_vendor`
	if [ -n "$panel_vendor" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor successfully from 4-004a $panel_vendor
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
	    sleep 1
	    continue
	fi
	#Synaptics
    elif [ -f /sys/bus/i2c/devices/4-0020/panel_vendor ]; then
	panel_vendor=`cat /sys/bus/i2c/devices/4-0020/panel_vendor`
	if [ -n "$panel_vendor" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor successfully from 4-0020 $panel_vendor
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
	    sleep 1
	    continue
	fi
	#Focal
    elif [ -f /sys/bus/i2c/devices/4-0038/panel_vendor ]; then
	panel_vendor=`cat /sys/bus/i2c/devices/4-0038/panel_vendor`
	if [ -n "$panel_vendor" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor successfully from 4-0038 $panel_vendor
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
	    sleep 1
	    continue
	fi
    else
	panel_vendor="0"
	/system/bin/log -p i -t panel-info-sh Get panel_vendor unsuccessfully, try again...
	sleep 1
    fi
done
case "$color" in
    "1")
        setprop sys.panel.color WHITE
        ;;
    "2")
        setprop sys.panel.color BLACK
        ;;
    "3")
        setprop sys.panel.color RED
        ;;
    "4")
        setprop sys.panel.color YELLOW
        ;;
    "5")
        setprop sys.panel.color GREEN
        ;;
    "6")
        setprop sys.panel.color PINK
        ;;
    "7")
        setprop sys.panel.color PURPLE
        ;;
    "8")
        setprop sys.panel.color GOLDEN
        ;;
    "9")
        setprop sys.panel.color SLIVER
        ;;
    "@")
        setprop sys.panel.color GRAY
        ;;
    "A")
        setprop sys.panel.color SLIVER_BLUE
        ;;
    *)
        setprop sys.panel.color UNKNOWN
        ;;
esac
case "$panel_vendor" in
    "1")
        setprop sys.panel.vendor BIELTPB
        ;;
    "2")
        setprop sys.panel.vendor LENS
        ;;
    "3")
        setprop sys.panel.vendor WINTEK
        ;;
    "4")
        setprop sys.panel.vendor OFILM
        ;;
    "5")
        setprop sys.panel.vendor BIELD1
        ;;
    "6")
        setprop sys.panel.vendor TPK
        ;;
    "7")
        setprop sys.panel.vendor LAIBAO
        ;;
    "8")
        setprop sys.panel.vendor SHARP
        ;;
    "9")
        setprop sys.panel.vendor JDI
		;;
    "@")
        setprop sys.panel.vendor EELY
        ;;
    "A")
        setprop sys.panel.vendor GISEBBG
        ;;
    "B")
        setprop sys.panel.vendor LGD
        ;;
    "C")
        setprop sys.panel.vendor AUO
        ;;
    "D")
        setprop sys.panel.vendor BOE
        ;;
    "E")
        setprop sys.panel.vendor DSMUDONG
        ;;
    "F")
        setprop sys.panel.vendor TIANMA
        ;;
    "G")
        setprop sys.panel.vendor TRULY
        ;;
    "H")
        setprop sys.panel.vendor SDC
        ;;
    "I")
        setprop sys.panel.vendor PRIMAX
        ;;
    *)
        setprop sys.panel.vendor UNKNOWN
        ;;
esac
