#!/bin/bash
# EA to go threw user directories and list the size of their box sync folder, if present

#set -x 

echo "<result>"
counter=0
for EXISTING_USER in $(/bin/ls /Users | sed -e '/Shared/d' -e '/Deleted Users/d' -e '/.localized/d' -e '/.DS_Store/d' -e '/.com.apple.timemachine.supported/d' -e '/Adobe/d' -e '/Library/d' -e '/.foxadmin/d' -e '/jamfadmin/d');
do
	if [ -d "/Users/$EXISTING_USER/Box Sync" ];
	then
		if [ $counter -ge 1 ];
		then
			echo ", "
		fi
		boxSize=`du -hc -d 0 /Users/$EXISTING_USER/Box\ Sync | tail -1 | awk '{print $1}'`
		echo "$EXISTING_USER - $boxSize"
		counter=$(($counter+1))
	fi
done
echo "</result>"
