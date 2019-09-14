#!/bin/bash

echo "1. nano"
echo "2. vi"
echo "3. links"
echo "4. exit"

while read input
do
    case $input in
        "1")
        nano
        ;;
        "2")
        vi
        ;;
        "3")
        links
        ;;
        "4")
        exit
        ;;
        *)
        echo "Enter value between 1-4"
        ;;
    esac
done
