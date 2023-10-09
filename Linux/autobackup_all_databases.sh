#!/bin/bash

DB_USER="root"
DB_PASS="root"
DB_NAME="alldb"

BACKUP_DIR="/home/user/mysqlbackup"
# UPLOAD_DIR="/var/www/html/mysqlbackup"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mysqldump --user=$DB_USER --password=$DB_PASS --all-databases > $BACKUP_DIR/$DB_NAME-$DATE.sql

zip $DB_NAME-$DATE.zip $DB_NAME-$DATE.sql

# mv $DB_NAME-$DATE.zip $UPLOAD_DIR

rm $BACKUP_DIR/$DB_NAME-$DATE.sql