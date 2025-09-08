#!/bin/bash

if [[ ! -n "$LNPA_PATH" ]]; then
  echo "LNPA_PATH needs to be set."
  exit 1
fi

if [[ ! -n "$LNPA_DEST" ]]; then
  echo "LNPA_DEST needs to be set."
  exit 1
fi

./src/appendData.py

pushd www-root
mkdir -p $LNPA_PATH

# Define the input and output files
input_file="_d_/index-template.html"
output_file="$LNPA_PATH/index.html"

cp $input_file $output_file

git add --force .
git commit -m "'$LNPA_PATH' -> '$LNPA_DEST' added."
git push origin