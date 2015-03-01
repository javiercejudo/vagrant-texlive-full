#!/bin/bash

# enable multiverse repo and update
sed -i "/^# deb .* multiverse$/ s/^# //" /etc/apt/sources.list
apt-get update

# install texlive
apt-get install -y texlive-full

# save latest iojs version in a variable
IOJS_VERSION=$(curl -s https://iojs.org/dist/index.json | grep -Po -m 1 '"version":.*?[^\\]",' | perl -pe 's/"version"://; s/^"//; s/",$//')
echo "Downloading io.js $IOJS_VERSION..."

curl -sOJL https://iojs.org/dist/$IOJS_VERSION/iojs-$IOJS_VERSION-linux-x64.tar.xz
tar xf iojs-$IOJS_VERSION-linux-x64.tar.xz

CWD=$(pwd)

echo "Installing io.js $IOJS_VERSION..."
ln -s $CWD/iojs-$IOJS_VERSION-linux-x64/bin/node /usr/local/bin/node
ln -s $CWD/iojs-$IOJS_VERSION-linux-x64/bin/iojs /usr/local/bin/iojs
ln -s $CWD/iojs-$IOJS_VERSION-linux-x64/bin/npm /usr/local/bin/npm

echo "Installing Grunt and Gulp"
npm install -g grunt-cli gulp
