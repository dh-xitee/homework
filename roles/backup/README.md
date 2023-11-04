This role ensures daily backup of the Website & DB at 8:00,16:00,24:00
Backups are located in /var/backup     
The playbook uses CRON to run a bash script located at /var/backup/backup.sh at the requested time

The original bash script was obtained from:
https://www.easyaslinux.com/tutorials/how-to-periodically-backup-your-website-and-mysql-database-to-local-server-as-well-as-s3-bucket-using-bash-script/
