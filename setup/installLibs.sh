#!/bin/bash

sudo apt-get -y install cmake yasm build-essential g++
sudo apt-get -y install x264 libx264-142 libx264-dev libfaac-dev
sudo apt-get -y install libvpx1 libvpx-dev libvorbis libmp3lame0 libmp3lame-dev
sudo apt-get -y install libxvidcore4 libxvidcore-dev

cd ../libs
git clone git://git.libav.org/libav.git
cd libav
git checkout tags/v11.4
./configure  --enable-gpl --enable-nonfree --enable-version3 --enable-shared --enable-libx264 --enable-libfaac --enable-libmp3lame --enable-libvpx --enable-libxvid --enable-libvorbis
make
make install
cd ..

cd qpsnr
make
chmod +x qpsnr
sudo cp qpsnr /usr/local/bin
cd ..



