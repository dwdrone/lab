#!/bin/bash
MACID=$(grep USB0_DEV_ADDR /etc/default/bb-mac-addr  | cut -d'=' -f2 | cut -d':' -f5,6 | sed 's/://' | tr '[:lower:]' '[:upper:]')
MCHANNEL=$((16#${MACID}%11+1))
sed 's/MACID/'${MACID}'/g' /etc/hostapd/hostapd.template > /etc/hostapd/hostapd.tmp
sed 's/MCHANNEL/'${MCHANNEL}'/g' /etc/hostapd/hostapd.tmp > /etc/hostapd/hostapd.conf
#rm /etc/hostapd/hostapd.tmp
