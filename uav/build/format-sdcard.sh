fdisk /dev/mmcblk0 << FDISK_CMDS
d
n
p
1
8192
7372799
N
n
p
2
7372800
14737407
n
p
3
14737408

w
FDISK_CMDS
fdisk -l /dev/mmcblk0
