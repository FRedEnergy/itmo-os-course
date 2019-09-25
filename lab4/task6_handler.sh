#!/bin/bash

is_interrupted=0

on_interrupt(){
   echo "Interrupted by sigterm"
   is_interrupted=1
}

loop(){
   
   trap 'on_interrupt' SIGTERM
   value=0

   while(( is_interrupted != 1 )) ; do
       ((value=$value + 1))
       sleep 5s
   done
}

echo $$ > "task6.pid"

loop
