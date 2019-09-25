#!/bin/bash

while read line ; do
    sig="" 
    case $line in
      "+")
         sig=USR1
         ;;
      "*")
         sig=USR2
         ;;
      "TERM")
         sig=SIGTERM
         ;;
    esac

    kill -"$sig" $(cat task7.pid) 
done
