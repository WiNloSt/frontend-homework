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

#remove livejs script
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' '/live/d' build/index.html
else
  sed -i '/live/d' build/index.html
fi

#deploy to gh-pages
mkdir -p ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
yarn gh-pages -- -d build
