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

cp img/am335x-debian-11.7-iot-armhf-2023-07-01-4gb.img build.img

sleep 4
mount -o offset=$((8192*512)) build.img /mnt/a/1

# rm /mnt/a/1/etc/systemd/network/usb0.network
# rm /mnt/a/1/etc/systemd/network/usb1.network

# modifications to the orignal image
cd rootfs-system
cp -rp . /mnt/a/1
cd ..

# add credentials for debian and root
cd rootfs-system
cp -rp . /mnt/a/1
cd ..

# modifications to suport PX4
#cd rootfs-px4
#cp -rp . /mnt/a/1
#cd ..

# modifications to suport ArudPilot
cd rootfs-ardupilot
cp -rp . /mnt/a/1
cd ..

date > /mnt/a/1/date-stamp.txt
sync -f /mnt/a/1
sleep 4
umount /mnt/a/1

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
