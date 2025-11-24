#!/bin/sh

if [ -n "$SERVER_OP" ]; then
    # replace commas with newlines and write all usernames to ops.txt
    echo "$SERVER_OP" | tr ',' '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | grep -v '^$' > /minecraft/ops.txt
fi

java $JAVA_ARGS -jar TekkitLegends.jar nogui
