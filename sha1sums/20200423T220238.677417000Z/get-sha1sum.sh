#!/usr/bin/env bash

set -eu


##-------------------------------------
## clean up from prior runs

mkdir -p ./sha1sums/
find ./sha1sums/ -maxdepth 1 -type f -exec rm '{}' \;

## leave no valid EDITOR.sha1 in case the process fails
mv ./build/EDITOR.sha1 ./build/EDITOR.sha1-OLD || true


##-------------------------------------
## get the relevant sources to hash

NOW=$(date -u +"%Y%m%dT%H%M%S.%NZ")
mkdir -p ./sha1sums/"$NOW"/
cd ./sha1sums/"$NOW"/

## relevant parts of package.json, sorted
jq -S 'with_entries(select([.key] | inside(["main", "files", "scripts", "devDependencies"])))' <../../package.json >./package.json

## all of package-lock.json, sorted
jq -S <../../package-lock.json >./package-lock.json

## webpack config
cat ../../webpack.config.js >./webpack.config.js

## actual editor
cat ../../src/ckeditor.js >./ckeditor.js

## this script
cat ../../get-sha1sum.sh >./get-sha1sum.sh


##-------------------------------------
## get the overall hash

sha1sum ** >FILES.sha1
<FILES.sha1 sha1sum | cut -f1 -d' ' >EDITOR.sha1
cp ./EDITOR.sha1 ../../build/EDITOR.sha1
