set -x

# Wireshark MAVLink Plugin
mkdir -p /home/kali/.config/wireshark/plugins 
cp mavlink_2_common.lua /home/kali/.config/wireshark/plugins 

cp -r ../Labs /home/kali/Desktop

cp -r ../Labs/Module \1 \ GCS/files/ESFileExplorerOpenPortVuln /home/kali
ln -s /home/kali/ESFileExplorerOpenPortVuln /home/kali/exploit

sudo gunzip /usr/share/wordlists/rockyou.txt.gz

# update john.conf
cp "../Labs/Module 3 COMMS/files/john.conf" /etc/john/john.conf

dpkg -i isc-dhcp-server_4.4.3-P1-2_amd64.deb

cd files
cp -rp etc/* /etc
cd ..

ifconfig eth0 down
ifconfig eth0 192.168.88.1
ifconfig eth0 up

systemctl enable isc-dhcp-server
systemctl start isc-dhcp-server

cp rtl8812au.tgz /home/kali
cd /home/kali 
tar xvzf rtl8812au.tgz 
cd rtl8812au
sudo make dkms_install
cd 

