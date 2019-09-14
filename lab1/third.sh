#!/bin/bash

result=""
while read input 
do
  if [[ $input = "q" ]]; then
      echo "$result"
      exit
  fi
  
  result="${result}${input}"
  echo "Input: ${input}"
done
