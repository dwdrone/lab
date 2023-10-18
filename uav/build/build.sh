#!/usr/bin/bash

# must run as root
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

# must have sdcard 
ret=$(cat /sys/kernel/debug/mmc0/ios | grep vdd | grep invalid | wc -l) 
if [[ "${ret}" == "1" ]]; then
	echo $ret
	echo 'sdcard not found at mmc0'  >&2
	exit 1
else
	umount /dev/mmcblk0p1 >/dev/null 2>&1
	umount /dev/mmcblk0p2 >/dev/null 2>&1
fi

# must have image
IMG=am335x-debian-11.7-iot-armhf-2023-07-01-4gb.img
if [ -f "img/${IMG}" ]; then
	cp img/${IMG} build.img
else
	echo image file not found:  ${IMG}
	exit 1
fi

MNTDIR=/mnt/tmp
if [ -d "${MNTDIR}" ]; then
	umount ${MNTDIR} 2>/dev/null
	mount -o offset=$((8192*512)) build.img ${MNTDIR}
	sleep 4
else
	echo mount dir not found: ${MNTDIR}
fi

# rm /mnt/a/1/etc/systemd/network/usb0.network
# rm /mnt/a/1/etc/systemd/network/usb1.network

# modifications to the orignal image
cd rootfs-system
cp -rp . ${MNTDIR}
cd ..

# add credentials for debian and root
cd rootfs-credentials
cp -rp . ${MNTDIR}
cd ..

# use the low resource cloud9 used in earlier versions of BB 
# both bb-code-server and nodered fail when run with ardupilot or px4
# possibly due to resource scarcity
cd rootfs-cloud9
cp -rp . ${MNTDIR}
cd ..

# modifications to suport PX4
cd rootfs-px4
cp -rp . ${MNTDIR}
cd ..

# modifications to suport ArudPilot
#cd rootfs-ardupilot
#cp -rp . ${MNTDIR}
#cd ..

date > ${MNTDIR}/date-stamp.txt
sync -f ${MNTDIR}
sleep 4
umount ${MNTDIR}

#echo $(( 7364608 / 512 ))
#14384
#echo $(( 8192 / 512 ))
#16
#echo $(( 512 * 512 ))
#262144
#dd if=build.img of=/dev/mmcblk0 skip=16 bs=262144 count=14384 status=progress 
dd if=build.img of=/dev/mmcblk0 bs=262144 status=progress 
sleep 4

#rm build.img
sync -f /dev/mmcblk0

# reformat card with additional partitions
./format-sdcard.sh
