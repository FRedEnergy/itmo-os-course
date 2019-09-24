#!/bin/bash

for f in /bin/* 
do
     if [[ -f $f && -x $f ]]
     then
        grep -Eos "^#!/bin.*" $f | sed -E "s|^|$f |"
     fi
done | sort --key 2
