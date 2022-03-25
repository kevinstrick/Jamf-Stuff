#!/bin/sh
# Jamf 'Site' assignment
# (if using the sites feature)
# credentials used should be a jamf service account which only has Read-Only access

apiURL="https://jamfpro.server.url:8443/JSSResource/computers/udid/"
apiUser="JAMF RO USER NAME"
apiPass="JAMF RO USER PASSWORD"
MacAdd=$( /usr/sbin/networksetup -getmacaddress en0 | /usr/bin/awk '{ print $3 }' | /usr/bin/sed 's/:/./g' )

udid=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Hardware UUID:/ { print $3 }')

siteName=$(/usr/bin/curl -H "Accept: application/xml" -s -u ${apiUser}:${apiPass} "${apiURL}${udid}" | /usr/bin/xpath '/computer/general/site/name[1]/text()' 2>/dev/null)

if [[ $siteName ]]; then
   echo "<result>${siteName}</result>"
else
   echo "<result>Not Available</result>"
fi
