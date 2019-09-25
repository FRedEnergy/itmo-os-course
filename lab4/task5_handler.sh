#!/bin/bash
mode=0
value=1
tail -0f data_exchange |
while read line ; do
   case $line in
       '+')
          mode=0
          ;;
       '*')
          mode=1
          ;;
       'QUIT')
          >&2 echo "Result: $value"
          exit 0
          ;;
       [0-9]*) case $mode in
             0) 
                ((value=$value+$line))
                ;;
             1)
                ((value=$value*$line))
                ;;
             *) 
                >&2 echo "Unknown mode: $mode"
                ;;
             esac
             ;;
          *) echo "Invalid input: $line"
             exit 0
             ;;
          esac         
done

pkill -P $$


