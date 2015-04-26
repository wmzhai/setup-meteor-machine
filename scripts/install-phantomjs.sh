#!/bin/bash

# Remove the lock
set +e
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock
sudo dpkg --configure -a
set -e

# Install PhantomJS
sudo apt-get -y install libfreetype6 libfreetype6-dev fontconfig
ARCH=`uname -m`
PHANTOMJS_VERSION=1.9.8

#sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}.tar.bz2
#we need to copy the phantomjs-1.9.8-linux-x86_64.tar.bz2 file to this folder before execute this script
sudo tar xvjf phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}.tar.bz2
sudo mv -f phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH} /usr/local/share/
sudo ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/bin/phantomjs

#display phantomjs version to see if we are ok
phantomjs --version