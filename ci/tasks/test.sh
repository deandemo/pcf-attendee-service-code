#!/bin/bash

set -e +x

pushd attendee-service
  echo "Executing unit tests"
  ./mvnw clean test
popd

find attendee-service/target/surefire-reports -type f -name *.txt -exec cp "{}" test-output/unit-test.txt \;

echo "Done unit testing"
exit 0
