#!/bin/sh

#  fusionDriveCheck.sh

# Assume that we are not dealing with a Fusion drive:
result="No"

# Check if there are at least two Physical Volumes
if [ 2 -le `diskutil cs list | grep "Physical Volume" | wc -l` ]; then
    # Get the size of the Logical Volumes and the sizes of the Phyisical Volumes
    sizes=(`diskutil cs list | awk -F: '/  Size:/ {print $2}' | awk '{print $1}'`)
    # Add the 2 sizes together, do they equal the first size we grabbed?
    if [ ${sizes[0]} -eq `expr ${sizes[1]} + ${sizes[2]}` ]; then
        result="Yes"
    fi
fi

echo "<result>$result</result>"
