#!/bin/bash

timeOn="$(/usr/sbin/systemsetup -getusingnetworktime | awk -F: '{print $2}' | tr -d '[:space:]')"

echo "<result>$timeOn</result>"
