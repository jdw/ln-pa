#!/bin/bash

if [[ ! -n "$LNPA_PATH" ]]; then
  echo "LNPA_PATH needs to be set."
  exit 1
fi

pushd www

# Define the input and output files
input_file="_d_/index-404-template.html"
output_file="$LNPA_PATH/index.html"

cp -f $input_file $output_file

git add .
git commit -m "Path '$LNPA_PATH' added."
git push origin