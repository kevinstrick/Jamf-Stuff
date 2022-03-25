#!/bin/bash

isempty=`find /Library/Application\ Support/JAMF/Waiting\ Room/ -maxdepth 0 -empty -exec echo {} is empty. \; ` 
if [ -d "/Library/Application Support/JAMF/Waiting Room" ];
    then
    if [ ! "$isempty" ];
        then
        echo "<result>Not Empty</result>";
    else
        echo "<result>Empty</result>";
    fi
else
     echo "<result>Empty</result>";
fi
exit 0
