#/bin/bash

installState="Not Installed"

if [ -e "/Library/Tanium/TaniumClient/TaniumClient" ]; 
then
    installState="Installed"
fi

echo "<result>$installState</result>"

exit 0
