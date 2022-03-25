#!/bin/bash

if [ -e "/Library/Tanium/TaniumClient/TaniumClient" ];
then
	taniumVersion=$(/Library/Tanium/TaniumClient/TaniumClient -v)
	echo "<result>$taniumVersion</result>"
fi

exit 0
