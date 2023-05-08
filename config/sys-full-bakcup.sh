#!/bin/bash

date
syst_dir=/backup/sys/
srv_name=node2 
srv_ip=192.168.1.101
srv_user=backup
srv_dir=sys

echo "Start Full backup system disk of ${srv_name}"
/usr/bin/rsync -avz --progress --numeric-ids --exclude="/dev" --exclude="/proc" --exclude="/sys" --exclude="/data"  --password-file=/etc/rsyncd.scrt ${srv_user}@${srv_ip}::${srv_dir} --backup --backup-dir=${syst_dir}${srv_name}/`date +%Y-%m-%d`/
date
echo "Finish Full backup system disk of ${srv_name}"
