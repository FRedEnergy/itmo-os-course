#!/bin/bash

ps -eo pid,cmd | grep '.* /sbin/.*' | awk -F ' ' '{ print $1 }' > sbin.txt
