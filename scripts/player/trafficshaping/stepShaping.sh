#!/bin/bash

BANDWIDTHS=(150 300 600 1300 3000 6000)
DURATION=10

while true
do
	number=$RANDOM

	let "number %= ${#BANDWIDTHS[@]}"

	echo "${BANDWIDTHS[$number]}"
	sudo wondershaper eth0 ${BANDWIDTHS[$number]} ${BANDWIDTHS[$number]}

	sleep $DURATION
done
