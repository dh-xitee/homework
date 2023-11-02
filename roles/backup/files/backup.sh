#!/bin/bash

###################################
backup_dir="/var/backup"
webapp_path="/var/www/html"
database_name="wordpress"
database_user="dbuser"
database_pwd="password"
database_host="localhost"
retention_days=14
##################################

date=`date +%d-%m-%y`
path="$backup_dir$date"
echo $date
mkdir -p $path > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "-Successfully  created directory $path"

    mysqldump -u $database_user -p$database_pwd -h $database_host $database_name > $path/db_backup.sql

    if [ $? -eq 0 ]; then
        echo "-Successfully created database dump"

        tar -czvf  $path/backup_with_db.tar.gz $webapp_path $path/db_backup.sql > /dev/null 2>&1

        if [ $? -eq 0 ]; then
                echo "-Successfully completed file + db  backup process"
        rm -rf $path/db_backup.sql

                old_date=`date --date="$retention_days day ago" +%d-%m-%y`
                old_path="$backup_dir$old_date"

                ls $old_path > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                        rm -rf $old_path > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                            echo "-Sucessfully removed old backup on $old_date"
                    else
                            echo "-Failed old backup removal $old_path" && exit 1
                    fi
        fi

        else
                echo "-Failed file +db backup process" && exit 1
        fi

    else
        echo "-Failed creating database dump, backup process failed" && exit 1
    fi

else
    echo "-Failed creating directory $path, backup process failed" && exit 1

fi