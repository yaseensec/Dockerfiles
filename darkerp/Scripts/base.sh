#!/bin/bash

#Update Ubuntu
apt-get update -y && apt-get upgrade -y

#Install Tzdata package and link location to /etc/localtime
apt-get install tzdata -y
ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

#Install Common Packages
apt-get install git curl wget cron sudo vim nginx -y

#Install Python and Requires Python Dependencies
apt-get install python3 python3-dev python3-pip python3-setuptools virtualenv -y

#Install Mariadb-Client and Redis Server
apt-get install mariadb-client redis-server -y

#Install wkhtmltopdf Package
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
apt-get install -y ./wkhtmltox_0.12.6-1.focal_amd64.deb
rm -rf wkhtmltox_0.12.6-1.focal_amd64.deb

#Install Nodejs,NPM and Yarn
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs
npm install -g yarn

#Create User and Provide Sudo Access
adduser --gecos '' --disabled-password erp
usermod -aG sudo erp
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#Clean Yarn & APT Cache and Remove this Executable
yarn cache clean
apt-get clean -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
rm -rf /base.sh
