#!/bin/bash

VIDEO=$1
EXPECTEDREPS=$2

echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 00.txt" | at 00:00
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 02.txt" | at 02:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 04.txt" | at 04:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 06.txt" | at 06:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 08.txt" | at 08:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 10.txt" | at 10:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 12.txt" | at 12:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 14.txt" | at 14:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 16.txt" | at 16:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 18.txt" | at 18:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 20.txt" | at 20:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS > 22.txt" | at 22:00 

