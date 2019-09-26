#!/bin/bash

grep "(WW)" "/var/log/Xorg.0.log" | sed -e "s/(WW)/Warning: /g" >> full.log
grep "(II)" "/var/log/Xorg.0.log" | sed -e "s/(II)/Information: /g" > full.log

