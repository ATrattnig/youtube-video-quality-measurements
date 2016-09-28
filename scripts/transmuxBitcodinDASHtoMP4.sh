#!/bin/bash

processDash () {
	cd $1
	for repDir in *video* ; do
    		echo "$1$repDir"
		CAT_COMMAND="cat $repDir/dash/init.mp4"
		for (( i=0; i<=230; i++ ))
		do
			CAT_COMMAND="$CAT_COMMAND $repDir/dash/segment_$i.m4s"
		done
		echo $CAT_COMMAND
		$CAT_COMMAND > "$repDir/video.mp4"
		MP4Box -add "$repDir/video.mp4" "$repDir.mp4"
		rm $repDir/video.mp4
	done
	cd ..
} 

for videoDir in */ ; do
    	processDash $videoDir
done
