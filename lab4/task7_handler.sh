#!/bin/bash

value=0
interrupted=0

usr1(){
   ((value=$value + 2))
}

usr2(){
   ((value=$value * 2))
}

exit(){
   echo "Value: $value"
   echo "Exiting due to sigterm from other process"
   interrupted=1
}

main(){
   trap 'usr1' USR1
   trap 'usr2' USR2
   trap 'exit' SIGTERM

   while [[ interrupted != 1 ]] ; do
      sleep 1s
   done
}

echo $$ > task7.pid

main


