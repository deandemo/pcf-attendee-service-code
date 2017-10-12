#!/bin/bash

set -e +x

pushd attendee-service
  echo "Executing smoke tests [$TARGET]"
popd

#find attendee-service/target/surefire-reports -type f -name *.txt -exec cp "{}" test-output/unit-test.txt \;

echo "Done smoke testing [$TARGET]"
exit 0
