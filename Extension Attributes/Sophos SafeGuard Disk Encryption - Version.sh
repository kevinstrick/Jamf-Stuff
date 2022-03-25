#!/bin/bash


#Check to see if SafeGuard is installed
if [ -f "/usr/bin/sgdeadmin" ]; then
result=`/usr/bin/sgdeadmin --version | grep Version | cut -c 63-`
	echo "<result>$result</result>"
elif [ -f "/usr/local/bin/sgdeadmin" ]; then
result=`/usr/local/bin/sgdeadmin --version | grep Version | cut -c 63-`
	echo "<result>$result</result>"
else
	echo "<result> </result>"
fi


