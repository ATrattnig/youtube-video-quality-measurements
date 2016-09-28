#!/bin/bash

#bbb iR7vXwvWwbU
#tos ivY-dEPCHkg

SPEED=5000
VIDEOID="iR7vXwvWwbU"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

exit
#tuning
bash measurePlayer.sh ivY-dEPCHkg tuning trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh ivY-dEPCHkg NoShapingTest1 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh ivY-dEPCHkg NoShapingTest2 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh ivY-dEPCHkg NoShapingTest3 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh ivY-dEPCHkg NoShapingTest4 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh ivY-dEPCHkg NoShapingTest5 trafficshaping/noShaping.sh 0 0 850

SPEED=50000
VIDEOID="iR7vXwvWwbU"
SHAPING="maieroWonderShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuningMaiero trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID "Maierotest"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

#tos tests

SPEED=500
VIDEOID="ivY-dEPCHkg"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

SPEED=1000
VIDEOID="ivY-dEPCHkg"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

SPEED=2000
VIDEOID="ivY-dEPCHkg"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

SPEED=5000
VIDEOID="ivY-dEPCHkg"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

SPEED=50000
VIDEOID="ivY-dEPCHkg"
SHAPING="constShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID $SPEED"test"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done

SPEED=50000
VIDEOID="ivY-dEPCHkg"
SHAPING="maieroWonderShaping.sh"
ITERATIONS=5
bash measurePlayer.sh $VIDEOID tuning$SPEED trafficshaping/$SHAPING $SPEED $SPEED 1500
sleep 50
for (( ITERATION=1; ITERATION <= $ITERATIONS; ITERATION++ ))
do
	bash measurePlayer.sh $VIDEOID "Maierotest"$ITERATION trafficshaping/$SHAPING $SPEED $SPEED 1500
	sleep 50
done
