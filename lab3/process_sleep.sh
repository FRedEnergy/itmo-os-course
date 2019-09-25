#!/bin/bash

for process in $(ps -A -o pid -no-headers)
do
    [[ ! -f /proc/$process/sched ]] && continue
    ppid=$(grep "^PPid:" /proc/$process/status | cut -d':' -f2-)
    sum_exec_runtime=$(grep "^se.sum_exec_runtime"  /proc/$process/sched | cut -d':' -f2-)
    nr_switches=$(grep "^nr_switches" /proc/$process/sched | cut -d':' -f2-)
    avg_atom=$sum_exec_runtime
    if [[ $nr_switches -gt "0" ]]; then
        avg_atom=$(echo $sum_exec_runtime"/"$nr_switches | bc -l)
    fi   
    printf "%s-ProcessID=%s : Parent_ProcessID=%s : Average_Sleeping_Time=%.2f\n" $ppid $process $ppid $avg_atom
done | sort -t '-' -n -k1 | cut -d'-' -f2- > process_sleep_time.txt
