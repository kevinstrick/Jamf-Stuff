#!/bin/bash

IBRIDGE="$(/usr/sbin/system_profiler SPiBridgeDataType | /usr/bin/grep 'Model Name')"

if [[ "${IBRIDGE}" == "" ]] ; 
then
    /bin/echo "<result>None</result>"
else
    /bin/echo "<result>${IBRIDGE}</result>"
fi

exit 0
