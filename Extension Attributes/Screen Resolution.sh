#!/bin/sh
echo "<result>`/usr/sbin/system_profiler SPDisplaysDataType | awk -F: '/Resolution/ {print $2}'`</result>"
