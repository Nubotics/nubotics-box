#!/bin/bash

# User and Group (Since DigitalOcean does not have a vagrant user)
echo "Creating user and group"
sudo adduser --disabled-password --gecos "" vagrant
sudo groupadd vagrant
sudo usermod -G vagrant vagrant

# MongoDB
echo "Updating mongo key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4F4EA0AAE5267A6C
#echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list



