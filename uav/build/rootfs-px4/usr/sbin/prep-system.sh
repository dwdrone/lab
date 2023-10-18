#!/bin/bash

echo Running system prep > /var/prep.txt

#/usr/sbin/pkg-installer.sh

systemctl enable rc-local.service
systemctl enable px4
systemctl enable cloud9.service

#systemctl start px4
#systemctl start cloud9.service
