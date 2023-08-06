echo rootfs-system
cd rootfs-system
tar cJf  ../files/rootfs-system.tar.xz .
cd ..

echo rootfs-credentials
cd rootfs-credentials
tar cJf  ../files/rootfs-credentials.tar.xz .
cd ..

echo rootfs-ardupilot
cd rootfs-ardupilot
tar cJf  ../files/rootfs-ardupilot.tar.xz .
cd ..

echo rootfs-px4
cd rootfs-px4
tar cJf  ../files/rootfs-px4.tar.xz .
cd ..

