#!/bin/bash

if dscl . read /Users/root | grep -q AuthenticationAuthority; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi
