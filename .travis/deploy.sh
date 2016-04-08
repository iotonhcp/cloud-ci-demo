#!/bin/bash 
BRANCH=$1
NEO=./target/sdk/tools/neo.sh

echo Deploying branch ${BRANCH}
$NEO deploy -a "$ACCOUNT" \
    -b "$BRANCH" \
    -h "$LANDSCAPE_HOST" \
    -u "$DEPLOY_USERNAME" \
    -p "$DEPLOY_PASSWORD" \
    -s ./target/com.sap.iot.starterkit.ui.war
    
echo "Restarting app...";

$NEO restart -a "$ACCOUNT" \
    -b "$BRANCH" \
    -h "$LANDSCAPE_HOST" \
    -u "$DEPLOY_USERNAME" \
    -p "$DEPLOY_PASSWORD" \
    --synchronous \
    || exit 1
echo "DEPLOYMENT FINISHED"
