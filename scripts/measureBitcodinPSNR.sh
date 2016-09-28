#!/bin/bash

processDash () {
	cd $1
	for repDir in *video*mp4 ; do
		echo "/media/sf_shared/Bitcodin/$1$repDir"
	done
	cd ..
} 

for videoDir in */ ; do
    	processDash $videoDir
done

