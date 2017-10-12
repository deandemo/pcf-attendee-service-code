#!/bin/bash

set -xe

pwd
env

cf api $CF_API --skip-ssl-validation

cf login -u $CF_USER -p $CF_PWD

cf apps

cf routes

export CF_DOMAIN_NAME=$CF_APP_DOMAIN
export MAIN_ROUTE_HOSTNAME=main-$CF_APP_SUFFIX

export NEXT_APP_COLOR=$(cat ./current-app-info/next-app.txt)
export NEXT_APP_HOSTNAME=$NEXT_APP_COLOR-$CF_APP_SUFFIX

export CURRENT_APP_COLOR=$(cat ./current-app-info/current-app.txt)
export CURRENT_APP_HOSTNAME=$CURRENT_APP_COLOR-$CF_APP_SUFFIX

echo "Mapping main app route to point to BLUE instance"
cf map-route attendee-service-blue apps.cumuluslabs.io -n attendee-service-propanedioic-proportion
cf routes

echo "Removing previous main app route that pointed to $CURRENT_APP_HOSTNAME instance"

set +e
cf unmap-route attendee-service apps.cumuluslabs.io -n attendee-service-propanedioic-proportion
set -e

echo "Routes updated"

cf routes
