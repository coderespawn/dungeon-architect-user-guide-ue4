#!/bin/bash

# Run the script from the gh-pages branch and from the scripts directory

cd ..
rm -rf stage_scripts
cp -rf scripts stage_scripts
cd stage_scripts

./build_version_header.sh
cat VERSIONS | while read version 
do
	git checkout $version
	git pull
	./build_user_guide.sh $version
done < "${1:-/dev/stdin}"

git checkout gh-pages


