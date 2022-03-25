#/bin/bash

version=""
isNotActive=$( sysctl cs)


if [ "$?" -eq 0 ] 
then
    version=$( sysctl cs.version | awk '{print $2}' )
fi

echo "<result>$version</result>"

exit 0
