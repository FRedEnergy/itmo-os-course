#!/bin/bash

ppid=0
timesum=0
processes=0

while read line
do
    next_ppid=$(echo $line | grep -Ehsio "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
    next_sleep=$(echo $line | grep -Ehsio  "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+" | awk '{ printf("%s", $1) } ')
    if [[ ! "$next_ppid" -eq "$ppid" ]]
    then
         if [[ ! "$ppid" -eq "0" ]]
         then
             avg=$(echo $timesum"/"$processes | bc -l)
             echo "Average_Sleeping_Children_of_ParentID="$ppid" is "$avg
             timesum=0
         fi
    fi
    echo $line
    ppid=$next_ppid
    timesum=$(echo $timesum"+"$next_sleep | bc -l)
    processes=$((processes+1))
done
