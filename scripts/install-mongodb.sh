#!/bin/bash

# Remove the lock
set +e
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock
sudo dpkg --configure -a
set -e

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

# Restart mongodb
sudo service mongod start

# display mongo version to see if we are ok
mongo --version