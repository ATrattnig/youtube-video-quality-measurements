 #!/bin/bash

echo " Startup sleep "
sleep 5
tc qdisc add dev eth0 root handle 1:0 tbf rate 750 buffer 7500 latency 70
tc qdisc add dev eth0 parent 1:0 handle 10: netem delay 80
echo " switch 750 "
sleep 60

tc qdisc change dev eth0 root handle 1:0 tbf rate 350 buffer 3500 latency 70
echo " switch 350 "
sleep 90

tc qdisc change dev eth0 root handle 1:0 tbf rate 2500 buffer 25000 latency 70
echo " switch 2500 "
sleep 120

tc qdisc change dev eth0 root handle 1:0 tbf rate 500 buffer 5000 latency 70
echo " switch 500 "
sleep 90

tc qdisc change dev eth0 root handle 1:0 tbf rate 700 buffer 7000 latency 70
echo " switch 700 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 1500 buffer 15000 latency 70

echo " switch 1500 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 2500 buffer 25000 latency 70
echo " switch 2500 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 3500 buffer 35000 latency 70
echo " switch 3500 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 2000 buffer 20000 latency 70
echo " switch 2000 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 1000 buffer 10000 latency 70
echo " switch 1000 "
sleep 30

tc qdisc change dev eth0 root handle 1:0 tbf rate 500 buffer 5000 latency 70
echo " switch 500 "
sleep 220

tc qdisc del dev eth0 root
echo "end script "
