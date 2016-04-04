#!/bin/bash

VIDEO=$1
EXPECTEDREPS=$2
REGION=$3

echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 00:00 $REGION > 00.txt" | at 00:00
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 02:00 $REGION > 02.txt" | at 02:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 04:00 $REGION > 04.txt" | at 04:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 06:00 $REGION > 06.txt" | at 06:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 08:00 $REGION > 08.txt" | at 08:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 10:00 $REGION > 10.txt" | at 10:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 12:00 $REGION > 12.txt" | at 12:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 14:00 $REGION > 14.txt" | at 14:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 16:00 $REGION > 16.txt" | at 16:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 18:00 $REGION > 18.txt" | at 18:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 20:00 $REGION > 20.txt" | at 20:00 
echo "bash uploadMeasurement.sh $VIDEO $EXPECTEDREPS 22:00 $REGION > 22.txt" | at 22:00 

