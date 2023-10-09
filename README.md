# Automatically Backup MySQL/MariaDB Databases in Linux & Windows

## Linux (Backup All Databases)

- Install .zip

```
sudo apt install zip
```

- Create folder

```
mkdir mysqlbackup
```

```
cd mysqlbackup
```

- Create file

```
vim autobackup_all_databases.sh
```

- Copy and paste the code

```
#!/bin/bash

DB_USER="root"
DB_PASS="root"
DB_NAME="alldb"

BACKUP_DIR="/path/to"
# UPLOAD_DIR="/var/www/html/mysqlbackup"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mysqldump --user=$DB_USER --password=$DB_PASS --all-databases > $BACKUP_DIR/$DB_NAME-$DATE.sql

zip $DB_NAME-$DATE.zip $DB_NAME-$DATE.sql

# mv $DB_NAME-$DATE.zip $UPLOAD_DIR

rm $BACKUP_DIR/$DB_NAME-$DATE.sql

# remove 7 days old backup file
# find $BACKUP_DIR -type f -name "*.zip" -mtime +7 -delete
```

- Edit and Fill your database username (DB_USER) and password (DB_PASSWORD)

- Setup Scheduler, after that choose nano/vim and enter

```
crontab -e
```

- If you want to backup your database after every “2 AM” copy this and save the file

```
0 2 * * * /path/to/autobackup_all_databases.sh
```

- If you want to backup your database after every 10 Minutes” copy this and save the file

```
*/10 * * * * /path/to/autobackup_all_databases.sh
```

- That's it, done.

## Windows (Backup All Databases)

- Run your xampp or laragon
- Download all file in folder `Windows`
- Rename folder `Windows` to `xamppbackup`
- Edit file `autobackup_all_databases.bat`
- Fill your database username (mysql_username) and password (mysql_password)
- Setup Scheduler

  https://user-images.githubusercontent.com/96189603/229654941-d39521b4-300f-4c0e-bbc0-b6e73fda52ae.mp4

- That's it, done.
