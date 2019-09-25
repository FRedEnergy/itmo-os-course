#!/bin/bash

ps -eouser,pid,cmd | grep "^root" | awk '{ print $2 ":" $3  }' > out.txt
echo "$(wc -l < out.txt)"
