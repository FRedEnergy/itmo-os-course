#!/bin/bash

crontab -l > tmp_table
echo "*/5 * * * 6 $HOME/labs/lab4/task1.sh" >> tmp_table
crontab tmp_table
rm tmp_table
