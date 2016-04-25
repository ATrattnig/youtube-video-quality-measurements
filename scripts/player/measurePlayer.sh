#!/bin/bash

VIDEOID=$1
SETUPDESC=$2
SHAPINGSCRIPT=$3

sudo wondershaper clear eth0
google-chrome "file:///home/armin/projects/youtube-video-quality-measurements/player/index.html?videoid=$VIDEOID&setup=$SETUPDESC" &
sudo bash $SHAPINGSCRIPT 1000 1000 900
