#!/bin/bash
###################################
backup_dir="/var/backup"
webapp_path="/var/www/html"
database_name="wordpress"
database_user="root"
database_pwd="pasx.123"
database_host="localhost"
retention_days=14
##################################

date=`date "+%Y-%m-%d_%H-%M"`
path="$backup_dir/$date"
echo $date
mkdir -p $path > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "-Successfully created directory $path"

    podman exec wp_mariadb mariadb-dump --user $database_user --password=$database_pwd $database_name > /var/backup/wordpress.sql
    mv /var/backup/wordpress.sql $path
    
    if [ $? -eq 0 ]; then
        echo "-Successfully created database dump"

        podman volume export wp_html --output $path/wp_html.tar 
        tar -czvf  $backup_dir/$date.tar.gz $path/wp_html.tar $path/wordpress.sql > /dev/null 2>&1

        if [ $? -eq 0 ]; then
                echo "-Successfully completed file + db  backup process"
        rm -rf $path

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