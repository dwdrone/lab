#!/bin/bash
cd /var/lib/pkgs

for i in $(ls -1 *deb); do
	dpkg -i ${i} 2>/dev/null
done
