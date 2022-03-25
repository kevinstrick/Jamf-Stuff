#!/bin/bash
# checkUsersWithSecureToken.sh
#
# Purpose: Determines which users have a Secure Token on High Sierra
# This tells us which users will be able to utilize filevault
#
# Original Written by: Patrick Gallagher
# Modified by: Kevin Strick

OSvers=$( sw_vers -productVersion | cut -d. -f2 )

if [[ "$OSvers" -le 12 ]]; then
  echo "<result>N/A</result>"
  exit 0
fi

except=('fvadmin' 'jamfadmin' 'foxadmin')
list=()

  # generate user list of users that do have not have a secure token
  for username in $(dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'); do
    TestAdminToken=$( (dscl . -read /Users/$username AuthenticationAuthority) 2>&1)
      if [[ "$TestAdminToken" == *SecureToken* ]] &&
        grep -qvFf <(printf '%s\n' "${except[@]}") <(echo "$username")
      then
        # Any reported accounts are added to the array list
        list+=("$username")
      fi
  done

# Prints the array's list contents
echo "<result>${list[*]}</result>"
