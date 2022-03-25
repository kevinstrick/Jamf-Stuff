#!/bin/bash

BU="$(cat /Library/Tanium/TaniumClient/Tools/CustomTags.txt )"

if [[ -f "/Library/Tanium/TaniumClient/Tools/CustomTags.txt" ]];
then
    echo "<result>$BU</result>"
fi

