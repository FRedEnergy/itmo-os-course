#!/bin/bash

amount=0;
while read input
do
   amount=$((amount+1))
   if ! (( "$input" % 2 )); then
      echo "$amount";
      exit;
   fi
done
