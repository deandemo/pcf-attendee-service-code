#!/bin/bash

set -e +x

echo "Executing smoke tests [$TARGET]"

TARGET_URL=http://attendee-service-propanedioic-proportion.apps.cumuluslabs.io/attendees
if [ $TARGET == 'blue' ]; then
  TARGET_URL=http://attendee-service-blue-salicaceous-bunco.apps.cumuluslabs.io/attendees
fi;

echo "Targeting [$TARGET_URL]"

if curl --fail $TARGET_URL; then
    echo "passed"
    exit 0
else
    echo "failed"
    exit 1
fi;
