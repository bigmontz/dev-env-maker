#!/bin/bash

ISSUE_ID=$1
HOURS=$2
COMMENT=$3


if [ -z "$REDMINE_URL" ]; then
    echo "You have to define the env variable REDMINE_URL"
    exit
fi

if [ -z "$REDMINE_APIKEY" ]; then
    echo "You have to define the env variable REDMINE_APIKEY"
    exit 
fi

URL="$REDMINE_URL/time_entries.xml"
PAYLOAD="<time_entry><issue_id>$ISSUE_ID</issue_id><hours>$HOURS</hours><comments>$COMMENT</comments></time_entry>"
curl -H "Content-Type: application/xml" -X POST -d "$PAYLOAD" -H "X-Redmine-API-Key: $REDMINE_APIKEY" $URL
