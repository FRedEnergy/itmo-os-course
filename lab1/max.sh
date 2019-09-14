#!/bin/bash

max="$1"

for x in "$@"
do
   ((x > max)) && max=$x
done

echo "$max"

