#!/bin/bash
# simple_system_health.sh

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
if [ $CPU -gt $CPU_THRESHOLD ]; then
    echo "CPU usage high: $CPU%"
fi

# Memory usage
MEM=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ $MEM -gt $MEM_THRESHOLD ]; then
    echo "Memory usage high: $MEM%"
fi

# Disk usage
DISK=$(df / | tail -1 | awk '{print int($5)}')
if [ $DISK -gt $DISK_THRESHOLD ]; then
    echo "Disk usage high: $DISK%"
fi

# Top 3 CPU and Memory processes
echo "Top 3 CPU processes:"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 4

echo "Top 3 Memory processes:"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 4
