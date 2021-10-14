#!/bin/bash

#Create New Bench Site If it doesnt Exists
if [ ! -e /home/erp/frappe-bench/sites/erp.yaseenins.com ]; then
     echo "-- SITE NOT CREATED --"
     cd /home/erp/frappe-bench/
     bench new-site $SITES --verbose --db-name $MARIADB_DB_NAME --mariadb-root-username $MARIADB_USER --mariadb-root-password $MARIADB_ROOT_PASSWORD --db-host $MARIADB_HOST --db-port $MARIADB_DB_PORT --admin-password $ADMIN_PASSWORD --install-app erpnext
else
    echo "-- SITE ALREADY CREATED --"
fi

sudo service nginx start 
bench start 


