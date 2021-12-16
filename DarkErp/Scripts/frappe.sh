#!/bin/bash

#Set Environmnet Variables 
set -a
source .env
set +a

#Update and Upgrade Base Image
sudo apt-get update -y
sudo apt-get upgrade -y

#Config PIP for no-cache directory
pip3 config set global.no-cache-dir false

#Install Frappe-Bench
sudo -H pip3 install frappe-bench
bench init --frappe-path $FRAPPE_GIT_URL --frappe-branch $FRAPPE_BRANCH --python /usr/bin/python3 frappe-bench
cd frappe-bench
./env/bin/pip3 install -e apps/frappe/

#Install Erpnext
bench get-app --branch $ERPNEXT_BRANCH erpnext $ERPNEXT_GIT_URL
./env/bin/pip3 install -e apps/erpnext/

#Configure Nginx
sudo rm -f /etc/nginx/sites-enabled/*
sudo chown erp:erp /home/erp/nginx.conf
sudo ln -s /home/erp/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#Clean and Remove this file
yarn cache clean
sudo apt-get clean -y
sudo apt-get autoclean -y
sudo rm -rf /home/erp/frappe.sh
sudo rm -rf /base.sh
