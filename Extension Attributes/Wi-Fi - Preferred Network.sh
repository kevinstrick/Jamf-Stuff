#!/bin/bash
# Extension attribute to find the wireless network that's first on the list
# Lauren Caliolio 8/22/2014
# Contact me: laurendc@gmail.com, twitter @laurendc or JAMFNation: laurendc
# slight mod on 9-12 added if-then to test for presence of wi-fi device

# Find device on hardware irregardless of model
WIFI_DEVICE=`/usr/sbin/networksetup -listallhardwareports | /usr/bin/egrep -A2 'Airport|Wi-Fi' | /usr/bin/awk '/Device/ { print $2 }'`

if [ -n "$WIFI_DEVICE" ]; then

# Get name of preferred wireless network that's first on the list
FIRST=`/usr/sbin/networksetup -listpreferredwirelessnetworks $WIFI_DEVICE | /usr/bin/awk 'NR==2{ print $1}'`
/bin/echo "<result>"$FIRST"</result>"

else

/bin/echo "<result>"N/A"</result>"
fi

exit 0
