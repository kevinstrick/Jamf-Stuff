#!/bin/bash
# HFS or APFS?

boot_filesystem_check=$(/usr/sbin/diskutil info / | awk '/Type \(Bundle\)/ {print $3}')
 
 
echo "<result>$boot_filesystem_check</result>";

exit
