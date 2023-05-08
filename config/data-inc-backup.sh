#!/bin/bash
date
syst_dir=/backup/data/
srv_name=node2 
srv_ip=192.168.1.101
srv_user=backup
srv_dir=data

echo "Start backup data daily ${srv_name}"
mkdir -p ${syst_dir}${srv_name}/increment/
/usr/bin/rsync -avz --progress --delete /usr/bin/rsync -avz --progress --delete  --password-file=/etc/rsyncd.scrt ${srv_user}@${srv_ip}::${srv_dir}
${syst_dir}${srv_name}/current/ --backup --backup-dir=${syst_dir}${srv_name}/increment/`date +%Y-%m-%d`/
date
echo "Finish backup daily data ${srv_name}"

