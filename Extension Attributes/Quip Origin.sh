#!/bin/sh
# Identify App Store vs VPP vs non App Store.


if [[ -d /Applications/Quip.app ]]; 
then

QuipAppStore="$(mdls /Applications/Quip.app -name kMDItemAppStoreHasReceipt | awk -F= '{print $2}')"


    if [[ ${QuipAppStore} -eq 1 ]]; 
    then
    
    QuipVPP="$(mdls /Applications/Quip.app -name kMDItemAppStoreReceiptIsVPPLicensed | awk -F= '{print $2}')"
    
        if [[ ${QuipVPP} -eq 1 ]]; 
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
