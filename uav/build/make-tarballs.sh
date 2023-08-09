#!/usr/bin/bash

# must run as root
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

echo rootfs-system
cd rootfs-system
chown -R root:root .
chmod u+s bin/tar
tar cJf  ../files/rootfs-system.tar.xz .
cd ..

echo rootfs-credentials
cd rootfs-credentials
chown -R root:root .
chown -R 1000:1000 home/debian
tar cJf  ../files/rootfs-credentials.tar.xz .
cd ..

echo rootfs-ardupilot
cd rootfs-ardupilot
chown -R root:root .
#chown -R 1002:1002 home/ardupilot
tar cJf  ../files/rootfs-ardupilot.tar.xz .
cd ..

echo rootfs-px4
cd rootfs-px4
chown -R root:root .
#chown -R 1001:1001 home/px4
tar cJf  ../files/rootfs-px4.tar.xz .
cd ..

