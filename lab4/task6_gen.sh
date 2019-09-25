#!/bin/bash

while read line ; do
   if [[ $line -eq "TERM" ]] ; then
      kill $(cat task6.pid) 
      echo "Killed"
   fi
done

