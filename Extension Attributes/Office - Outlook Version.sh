#!/bin/sh #created by ks


outversion=`defaults read /Applications/Microsoft\ Outlook.app/Contents/Info CFBundleVersion`

if [ -d "/Applications/Microsoft Outlook.app" ];
then
    echo "<result>$outversion</result>"
else
    echo "<result>Not Installed</result>"
fi
