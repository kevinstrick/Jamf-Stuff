#!/bin/bash

timeServer="$(/usr/sbin/systemsetup -getnetworktimeserver | awk -F: '{print $2}' | tr -d '[:space:]')"

echo "<result>$timeServer</result>"
