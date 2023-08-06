#!/bin/bash

for fw in $(ls -1 /var/updates/rootfs*xz); do
	cd /
	echo processing $fw
	tar xvJf $fw
done
