#!/bin/bash

#Check to see if SafeGuard is installed
if [ -f "/usr/bin/sgdeadmin" ]; then
result=`/usr/bin/sgdeadmin --status | grep "System disk" |  awk '{print $4,$5,$6}'`
	echo "<result>$result</result>"
elif [ -f "/usr/local/bin/sgdeadmin" ]; then
result=`/usr/local/bin/sgdeadmin --status | grep "System disk" |  awk '{print $4,$5,$6}'`
	echo "<result>$result</result>"
else
	echo "<result> </result>"
fi
