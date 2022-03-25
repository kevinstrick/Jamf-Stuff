#!/usr/bin/env bash

# Run Once Option
# Update (24-JUL-2019): Added runOnce option
# Agree with [~elliotjordan] that we should avoid excessively querying Apple

# Set runOnce bool to true(1) to limit querying qualityprograms.apple.com to the 
# first instance of receiving an expected response (E00, E01, FE01, or FE02)
# that is not a processing error (E99 or FE03).
runOnce="true"

if [[ "$runOnce" == "true" || "$runOnce" == "1" ]]; then
    if [[ -e /usr/local/xattr/.appleRecall062019CheckDone ]]; then
        # Using runOnce cached value:
        echo "<result>$(cat /usr/local/xattr/.appleRecall062019CheckDone | head -n 1)</result>"
        # Delete /usr/local/xattr/.appleRecall062019CheckDone to re-query qualityprograms.apple.com
        exit 0
    fi
fi

createRecallCheckDone () {
    mkdir -p /usr/local/xattr
    echo $1 > /usr/local/xattr/.appleRecall062019CheckDone
}

postURL="https://qualityprograms.apple.com/snlookup/062019"
quotSerial=$(ioreg -l | grep IOPlatformSerialNumber | awk '{print $4}')
quotGUID='"'$(uuidgen | tr "[:upper:]" "[:lower:]")'"'
modelID=$(system_profiler SPHardwareDataType | grep "Model Identifier" | awk '{print $3}')

# Be nice to qualityprograms.apple.com and only query valid models by pre-qualifying:
if [[ "$modelID" == "MacBookPro11,4" || "$modelID" == "MacBookPro11,5" ]]; then
    # 12 charlen for all serials in affected years (14 incl quote)
    # 36 charlen for all guids (38 incl quote)
    if [[ "${#quotSerial}" -eq 14 ]]; then
        if [[ "${#quotGUID}" -eq 38 ]]; then
            postData="{\"serial\":$quotSerial,\"GUID\":$quotGUID}"
            resp=$(curl -d "$postData" -H "Content-Type: application/json" -X POST "$postURL")
            if [[ "$resp" == *'"status":"E00"'* ]]; then
                echo "<result>E00-Eligible</result>"
                createRecallCheckDone "E00-Eligible"
            elif [[ "$resp" == *'"status":"E01"'* ]]; then
                echo "<result>E01-Ineligible</result>"
                createRecallCheckDone "E01-Ineligible"
            elif [[ "$resp" == *'"status":"E99"'* ]]; then
                echo "<result>E99-ProcessingError</result>"
                # createRecallCheckDone "E99-ProcessingError"
            elif [[ "$resp" == *'"status":"FE01"'* ]]; then
                echo "<result>FE01-EmptySerial</result>"
                createRecallCheckDone "FE01-EmptySerial"
            elif [[ "$resp" == *'"status":"FE02"'* ]]; then
                echo "<result>FE02-InvalidSerial</result>"
                createRecallCheckDone "FE02-InvalidSerial"
            elif [[ "$resp" == *'"status":"FE03"'* ]]; then
                echo "<result>FE03-ProcessingError</result>"
                # createRecallCheckDone "FE03-ProcessingError"
            else
                echo "<result>Err1-UnexpectedResponse</result>"
            fi
        else
            echo "<result>Err2-NotQueried-InvalidGuidLength</result>"
        fi
    else
        echo "<result>Err3-NotQueried-InvalidSerialLength</result>"
    fi
else
    echo "<result>Msg1-IneligibleModel</result>"
fi
