#!/bin/bash
C=2
new=`expr $C + 1`
max=`expr $new + 19`
./run_frontera_mortaza step5_production$C.inp step5_production$C.log 8 $C | awk 'NR==19 {print $4}' > jobID
for j in `seq $new $max`
do
read i < jobID;./follow_frontera_mortaza step5_production$j.inp step5_production$j.log 8 $i $j | awk 'NR==19 {print $4}' > jobID
done
