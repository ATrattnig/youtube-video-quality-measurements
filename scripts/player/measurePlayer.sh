#!/bin/bash

VIDEOID=$1
SETUPDESC=$2
SHAPINGSCRIPT=$3
UP=$4
DOWN=$5
DURATION=$6

sudo wondershaper clear eth2
firefox "file:///home/armin/private/youtube-video-quality-measurements/player/index.html?videoid=$VIDEOID&setup=$SETUPDESC" &
sudo bash $SHAPINGSCRIPT $DOWN $UP $DURATION
