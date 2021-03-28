#!/bin/bash

# Retrieve files from PR
#  then run:
# cat files | grep --incluy pgsanity /test.sql 

# TODO: 2021-03-28 pass github context as env variable to docker container
# Retrieve files from PR (*.sql)
# Run pgsanity on them

# pr_num=$(cat ${GITHUB_EVENT_PATH} | jq -r .pull_request.number)
# request_url="https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls/${pr_num}/files"
# auth_header="Authorization: token $GITHUB_TOKEN"
# files=$(curl -s -H "$auth_header" -X GET -G ${request_url} | jq -r '.[] | .filename')

files=$(find / -name '*.sql')
echo $files
#$files | grep --include \*.sql

echo $files | xargs pgsanity

if [[ $? -gt 0 ]]; then
  echo "Some files contain error. See above logs for details"
  exit 1
fi