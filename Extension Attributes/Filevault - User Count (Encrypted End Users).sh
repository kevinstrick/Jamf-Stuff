#!/bin/bash

eaResult=""
fvStatus="$(fdesetup status | grep -ic 'Filevault is On')"

if [[ $fvStatus -ne 1 ]];
then
	#disk is not encrypted
	exit
fi

eaResult="$(fdesetup list | grep -vc fvadmin)"

echo "<result>$eaResult</result>"


exit
