#!/bin/sh
set -e

if [ -n "$SERVER_OP" ]; then
  # replace commas with newlines and write all usernames to ops.txt
  echo "$SERVER_OP" | tr ',' '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | grep -v '^$' > /tekkit/ops.txt
fi

exec "$@"
