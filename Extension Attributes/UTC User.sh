#!/bin/sh
# Created by Patrick Twomey
# 5/25/17

User_IDs=`dscl . -list /Users UniqueID | awk '$2 > 500 {print $1; }'`
result="No"

for Each_uid in $User_IDs; do
	TheTypecache="/Users/$Each_uid/Library/Extensis/UTC/UniversalType.typecache/"
	FileSize=0
	if [ -e $TheTypecache ]; then
		FileSize=`du -sk $TheTypecache | awk '{ print $1 }'`
		if [ $FileSize -gt 999 ] ; then
			result="Yes"
		fi
	fi
done

echo "<result>$result</result>"
