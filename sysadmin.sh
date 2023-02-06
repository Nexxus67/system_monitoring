#!/bin/bash

# Define the interval for checking resource usage (in seconds)
interval=5

# Start an infinite loop
while true; do
  # Get current date and time
  date_time=`date +"%Y-%m-%d %T"`
  
  # Get system load average
  load_average=`uptime | awk '{print $10 $11 $12}'`
  
  # Get available memory
  memory=`free -h | grep Mem | awk '{print $7}'`
  
  # Get used disk space
  disk=`df -h | grep /dev/sda1 | awk '{print $5}'`
  
  # Display the resource usage data
  echo "$date_time | Load Average: $load_average | Available Memory: $memory | Used Disk Space: $disk"
  
  # Sleep for the specified interval
  sleep $interval
done
