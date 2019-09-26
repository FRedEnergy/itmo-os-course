#!/bin/bash

exp="\b[A-Za-z0-9]+@[A-Za-z0-9_]+(\\.[A-Za-z]+)+\b"
grep -E -h -s -o -w $exp /etc/* | awk 'ORS=","' > emails.lst
