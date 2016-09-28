#!/bin/bash

#bbb iR7vXwvWwbU
#tos ivY-dEPCHkg

#tuning
bash measurePlayer.sh iR7vXwvWwbU tuning trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh iR7vXwvWwbU NoShapingTest1 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh iR7vXwvWwbU NoShapingTest2 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh iR7vXwvWwbU NoShapingTest3 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh iR7vXwvWwbU NoShapingTest4 trafficshaping/noShaping.sh 0 0 850
#measuring
bash measurePlayer.sh iR7vXwvWwbU NoShapingTest5 trafficshaping/noShaping.sh 0 0 850

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

