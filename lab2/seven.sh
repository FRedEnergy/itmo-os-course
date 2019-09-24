#!/bin/bash


man bash | sed -e 's/\s/\n/g' | grep -vwE '\w{0,4}' | sort | uniq -c | sort -nr | head -n 3
