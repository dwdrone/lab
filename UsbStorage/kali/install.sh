set -x

# Wireshark MAVLink Plugin
mkdir -p /home/kali/.config/wireshark/plugins 
cp mavlink_2_common.lua /home/kali/.config/wireshark/plugins 

cp -r ../Labs /home/kali/Desktop

#cp -r ../Labs/Module \1 \ GCS/files/ESFileExplorerOpenPortVuln /home/kali
#ln -s /home/kali/ESFileExplorerOpenPortVuln /home/kali/exploit

cp /media/kali/DF7A-3561/kali/rtl8812au.tgz /home/kali
cd /home/kali 
tar xvzf rtl8812au.tgz 
cd rtl8812au
sudo make dkms_install

sudo gunzip /usr/share/wordlists/rockyou.txt.gz

# update john.conf
