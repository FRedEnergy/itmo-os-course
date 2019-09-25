#!/bin/bash

for process in $(ps -A -o pid)
do
   diff=$(awk -F ' ' '{print $2-$3}' < /proc/$process/statm)
   echo $process":"$diff
done | sort -t ':' -k2 -n -r
