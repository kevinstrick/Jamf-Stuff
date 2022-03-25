#!/bin/sh
# Identify App Store vs VPP vs non App Store.


if [[ -d /Applications/Slack.app ]]; 
then

SlackAppStore="$(mdls /Applications/Slack.app -name kMDItemAppStoreHasReceipt | awk -F= '{print $2}')"


    if [[ ${SlackAppStore} -eq 1 ]]; 
    then
    
    SlackVPP="$(mdls /Applications/Slack.app -name kMDItemAppStoreReceiptIsVPPLicensed | awk -F= '{print $2}')"
    
        if [[ ${SlackVPP} -eq 1 ]]; 
        then 
            echo "<result>VPPStore</result>"
        else
            echo "<result>APPStore</result>"
        fi
    else
        echo "<result>NonAPPStore</result>"
    fi
else
    echo "<result>NotInstalled</result>"
fi

exit 0
