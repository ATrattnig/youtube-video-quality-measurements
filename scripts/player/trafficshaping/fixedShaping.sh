#!/bin/bash

BANDWIDTHS=(700 50 1000 10 700 3000 5000 700 50 1000 10 700 3000 5000 700 50 1000 10 700 3000 5000 700 50 1000 10 700 3000 5000)
DURATIONS=(20 20 30 20 60 60 30 20 20 30 20 60 60 30 20 20 30 20 60 60 30 20 20 30 20 60 60 30)

durationAccum=0
for ((i=0;i<${#BANDWIDTHS[@]};++i)); do
    	bandwidth=${BANDWIDTHS[i]}
	duration=${DURATIONS[i]}
	echo "$durationAccum $bandwidth"
	
	let "durationAccum += $duration"
	sudo wondershaper eth0 $bandwidth $bandwidth
	sleep $duration
done

sudo wondershaper clear eth0
