#!/usr/bin/env bash

node_version=$@

if [ -z "$node_version" ]
then
    read -p "Please insert the NodeJS version: " node_version
fi

echo "Installing NodeJS v$node_version..."


wget https://nodejs.org/dist/v$node_version/node-v$node_version-linux-armv7l.tar.xz
echo "Unzipping node-v$node_version-linux-armv7l.tar.xz..."
tar -xJf node-v$node_version-linux-armv7l.tar.xz
rm node-v$node_version-linux-armv7l.tar.xz

echo "Deploing NodeJS files..."
rm -Rf /usr/local/node
mv node-v$node_version-linux-armv7l /usr/local/node
rm -Rf node-v$node_version-linux-armv7l
rm /usr/bin/node
ln -s /usr/local/node/bin/node /usr/bin/node
rm /usr/bin/npm
ln -s /usr/local/node/bin/npm /usr/bin/npm
rm /usr/bin/npx
ln -s /usr/local/node/bin/npx /usr/bin/npx

echo "Installing libatomic1..."

wget http://ftp.au.debian.org/debian/pool/main/g/gcc-14/libatomic1_14-20240429-1_armhf.deb
ar x libatomic1_14-20240429-1_armhf.deb
rm libatomic1_14-20240429-1_armhf.deb

echo "Unzipping libatomic..."
tar -xJf data.tar.xz
rm data.tar.xz
rm control.tar.xz
rm -Rf debian-binary

echo "Deploing libatomic1 files..."
rm /usr/lib/libatomic*
mv ./usr/lib/arm-linux-gnueabihf/* /usr/lib/
rm -Rf ./usr

echo "Checking NodeJS version:"
node -v
echo "Checking NPM version:"
npm -v
echo "Checking NPX version:"
npx -v

echo "NodeJS v$node_version instalation finalized."