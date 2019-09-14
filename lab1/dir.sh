#!/bin/bash

if [[ "$PWD" == "$HOME" ]]; then
   echo "$HOME"
   exit 0
else 
   echo "Not in home dir"
   exit 1
fi
