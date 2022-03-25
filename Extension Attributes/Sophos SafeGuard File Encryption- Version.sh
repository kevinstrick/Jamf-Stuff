#!/bin/bash


#Check to see if SafeGuard is installed
if [ -f "/usr/bin/sgfsadmin" ]; then
	result=`/usr/bin/sgfsadmin --version | grep Version | cut -c 54-`
elif [ -f "/usr/local/bin/sgfsadmin" ]; then
	result=`/usr/local/bin/sgfsadmin --version | grep Version | cut -c 54-`
else
	result=" "
fi

echo "<result>$result</result>"

exit 0
