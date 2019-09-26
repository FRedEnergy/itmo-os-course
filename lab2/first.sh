#!/bin/bash

echo "" > errors.log

for file in /var/log/*
do
    [ -f "$file" ] && grep -h "^ACPI" "$file" >> errors.log    
done

grep "/" errors.log
