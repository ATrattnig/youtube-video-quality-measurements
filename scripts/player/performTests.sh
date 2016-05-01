#!/bin/bash

#bbb iR7vXwvWwbU
#tos ivY-dEPCHkg

#tuning
bash measurePlayer.sh iR7vXwvWwbU tuning trafficshaping/constShaping.sh 500 500 900
#measuring
bash measurePlayer.sh iR7vXwvWwbU 500test1 trafficshaping/constShaping.sh 500 500 900
#measuring
bash measurePlayer.sh iR7vXwvWwbU 500test2 trafficshaping/constShaping.sh 500 500 900
#measuring
bash measurePlayer.sh iR7vXwvWwbU 500test3 trafficshaping/constShaping.sh 500 500 900
#measuring
bash measurePlayer.sh iR7vXwvWwbU 500test4 trafficshaping/constShaping.sh 500 500 900
#measuring
bash measurePlayer.sh iR7vXwvWwbU 500test5 trafficshaping/constShaping.sh 500 500 900

