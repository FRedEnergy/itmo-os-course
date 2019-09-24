#!/bin/bash

count=0
for log in /var/log/*.log
do
  ! [[ -f $log && -r $log ]] && continue
  log_size=$(grep "" -c $log) 
  count=$((count+log_size))
done
echo $count
