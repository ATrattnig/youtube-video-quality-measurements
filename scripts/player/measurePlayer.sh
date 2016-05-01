#!/bin/bash

VIDEOID=$1
SETUPDESC=$2
SHAPINGSCRIPT=$3
UP=$4
DOWN=$5
DURATION=$6

sudo wondershaper clear eth0
google-chrome "file:///home/armin/projects/youtube-video-quality-measurements/player/index.html?videoid=$VIDEOID&setup=$SETUPDESC" &
sleep $DURATION
#sudo bash $SHAPINGSCRIPT $DOWN $UP $DURATION
