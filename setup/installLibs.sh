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
sudo make install
cd ..

cd qpsnr
make
chmod +x qpsnr
sudo cp qpsnr /usr/local/bin
cd ..

sudo apt-get install python-pip
sudo pip install --upgrade google-api-python-client

sudo apt-get install subversion
svn co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac
cd gpac
sudo apt-get install zlib-bin zlib1g zlib1g-dev zlibc
./configure --use-js=no --disable-3d --disable-oss-audio --disable-x11-xv --disable-ssl --use-jpeg=no --use-png=no
make
sudo make install
cd ..

sudo curl https://yt-dl.org/downloads/2016.03.06/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sudo apt-get -y install wondershaper

sudo ldconfig
