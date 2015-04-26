#!/bin/bash

# Remove the lock
set +e
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock
sudo dpkg --configure -a
set -e

sudo apt-get -y install build-essential libssl-dev git curl

# Install Node.js - either nodeVersion or which works with latest Meteor release
NODE_VERSION=0.10.36
NODE_ARCH=x64
NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

#wget http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
#we need to put node-v0.10.36-linux-x64.tar.gz in the fold before excute the script
tar xvzf ${NODE_DIST}.tar.gz
sudo rm -rf /opt/nodejs
sudo mv ${NODE_DIST} /opt/nodejs

sudo ln -sf /opt/nodejs/bin/node /usr/bin/node
sudo ln -sf /opt/nodejs/bin/npm /usr/bin/npm

#display nodejs and npm version to see if we are ok
node --version
npm --version