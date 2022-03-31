#!/bin/sh
#created by ks 1/25/2012


silversion=`defaults read /Library/Internet\ Plug-Ins/Silverlight.plugin/Contents/Info CFBundleVersion`

echo "<result>$silversion</result>"
