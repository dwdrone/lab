set -x
adb uninstall 'com.estrongs.android.pop'
adb install 'apks/ES File Explorer File Manager_4.1.9.7.4_Apkpure.apk'
adb install 'apks/com.stealthcopter.portdroid_0.6.22-78_minAPI21(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk'
adb install apks/QGroundControl64-20230428-daily.apk
adb push  ../UsbStorage/labs/Module\ 1\ GCS/files/rootfs-system.tar.xz /sdcard
adb push  ../UsbStorage/labs/Module\ 1\ GCS/files/rootfs-ardupilot.tar.xz /sdcard

#adb install SevnAutorun.apk
#adb push SevnAutorun.db /sdcard/Download/SevnAutorun.db
#sleep 2
#adb shell run-as ru.org.sevn.autorun mkdir /data/data/ru.org.sevn.autorun/databases
#adb shell run-as ru.org.sevn.autorun cp /sdcard/Download/SevnAutorun.db /data/data/ru.org.sevn.autorun/databases/SevnAutorun.db
#adb shell run-as ru.org.sevn.autorun rm /sdcard/Download/SevnAutorun.db 

