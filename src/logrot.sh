#!/bin/bash

current_date=$(date +"%Y-%m-%d")
echo "Log rotating for current date: $current_date..."
os_name=$(uname -s)

if [ ! -f "ln.pa.log" ]; then
    echo "  ... no file found :("
    exit 0
fi

echo "  ... logfile found!"

pushd log
echo "Now in: $(pwd)"

git checkout --orphan logs/$current_date
git rm -rf .

mv ../ln.pa.log .

# Check if MacOS
if [ "$os_name" == "Darwin" ]; then
    md5_val=$(md5 -q ln.pa.log)
else
    md5_val=$(md5sum ln.pa.log | cut -d ' ' -f 1)
fi

echo $md5_val > ln.pa.log.md5-$current_date.txt
bzip2 ln.pa.log
git add .
git commit -m "The daily log rotation for $current_date"
git push --set-upstream origin logs/$current_date
git push origin 
