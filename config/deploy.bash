#!/usr/bin/env bash
set e

#create neccessary directory
mkdir -p build

#build css
yarn build-css

#copy html files to build directory
cp -r src/web/* build

#remove scss file
find build -name "*.scss" -delete

pwd
ls -la
ls -la build

#remove livejs script
sed -i '' '/live/d' build/index.html

#deploy to gh-pages
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
yarn gh-pages -- -d build
