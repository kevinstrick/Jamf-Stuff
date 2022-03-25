#/bin/bash

JSSURL=`defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url`

echo "<result>$JSSURL</result>"

exit 0
