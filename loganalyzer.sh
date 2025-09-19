#!/bin/bash
logfile="/var/log/wisecow.log"

if [ ! -f "$logfile" ]; then
    echo "Log file $logfile not found!"
    exit 1
fi

grep "ERROR" "$logfile" > error_log.txt
echo "Error log created at $(date)"
