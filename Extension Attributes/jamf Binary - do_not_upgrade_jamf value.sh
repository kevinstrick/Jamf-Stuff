#!/bin/bash
# checks to see if hte 'do not upgrade flag' is set for the binary

result=`/usr/libexec/PlistBuddy -c "print :do_not_upgrade_jamf" "/Library/Preferences/com.jamfsoftware.jamf.plist"`
echo "<result>$result</result>"
