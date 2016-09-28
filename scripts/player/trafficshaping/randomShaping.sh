#!/bin/bash

STARTBANDWIDTH=500
STEPSIZE=50
MIN=10
MAX=2000

bandwidth=$STARTBANDWIDTH

while true
do
	number=$RANDOM

	let "number %= 3"
	if [ $number == 0 ]; then
	       let "bandwidth += $STEPSIZE"
        fi

	if [ $number == 1 ]; then
               let "bandwidth -= $STEPSIZE"
        fi

	echo "$bandwidth"
	sudo wondershaper eth2 $bandwidth $bandwidth

	sleep 1
done
