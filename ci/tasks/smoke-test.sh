#!/bin/bash

set -e +x

echo "Executing smoke tests [$TARGET]"

TARGET_URL="http://$(cat ./current-app-info/next-app.txt)-attendee-service-dcb.apps.cumuluslabs.io/attendees"

echo "Targeting [$TARGET_URL]"

if curl --fail $TARGET_URL; then
    echo "passed"
    exit 0
else
    echo "failed"
    exit 1
fi;
