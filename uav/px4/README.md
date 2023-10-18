#Build notes for PX4

https://docs.px4.io/main/en/flight_controller/beaglebone_blue.html

as user, cd Tools/setup, 
	pip3 install -r requirements.txt



The BBBlue image is using 
	gcc version 10.2.1 20210110 (Debian 10.2.1-6) 

gcc-arm-10.2-2020.11-x86_64-arm-none-eabi.tar.xz
https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz

vi ./boards/beaglebone/blue/default.px4board
CONFIG_BOARD_TOOLCHAIN="arm-none-linux-gnueabihf"

PX4-Autopilot/platforms/posix/cmake$ vi Toolchain-arm-none-linux-gnueabihf.cmake 
set(triple arm-none-linux-gnueabihf)



Fixes for make errors (only for more recent versions of gcc - skip for gcc 10.2
vi cmake/px4_add_common_flags.cmake
        -Wno-address    
        -Wno-dangling-pointer

