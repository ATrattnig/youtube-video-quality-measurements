#!/bin/bash

UP=$1
DOWN=$2
DURATION=$3

echo "Const Shaping: Down: $DOWN Up: $UP Duration: $DURATION"
sudo wondershaper eth2 $DOWN $UP
sleep $DURATION
sudo wondershaper clear eth0
