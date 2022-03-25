#/bin/bash

installState="Not Installed"

if [ -f "/Library/CS/falconctl" ]; 
then
    installState="Installed"
fi

echo "<result>$installState</result>"

exit 0
