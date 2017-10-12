#!/bin/bash

set -e +x

echo "Executing smoke tests [$TARGET]"
echo "Param $1"
echo "PRODUCTION $PRODUCTION"
prefix=$(cat ./current-app-info/next-app.txt)
if [ -z "$1" ]; then
    echo "Testing prod url"
    prefix="main"
fi

TARGET_URL="http://$prefix-attendee-service-dcb.apps.cumuluslabs.io/attendees"

echo "Targeting [$TARGET_URL]"

if curl --fail $TARGET_URL; then
    echo "passed"
    exit 0
else
    echo "failed"
    exit 1
fi;
