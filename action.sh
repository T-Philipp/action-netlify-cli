#!/bin/bash

echo "Running Netlify CLI command..."
echo "> npx netlify-cli $*"

set -e
OUTPUT=$(bash -c "npx netlify-cli $*" | tr '\n' ' ')
set +e

[[ $OUTPUT =~ ^.*Website\sDraft\sURL:\s(.+).If.*$ ]]

NETLIFY_OUTPUT=$(echo $BASH_REMATCH[1])

echo "NETLIFY_OUTPUT=$NETLIFY_OUTPUT" >> $GITHUB_OUTPUT
