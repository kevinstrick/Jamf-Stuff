#!/bin/bash

result=`/usr/libexec/PlistBuddy -c "print :do_not_upgrade_jamf" "/Library/Preferences/com.jamfsoftware.jamf.plist"`
echo "<result>$result</result>"
