#!/bin/vbash
#delete runonprovision task

readonly logFile="/var/log/runonprovision.log"

source /opt/vyatta/etc/functions/script-template

configure > ${logFile}
delete system task-scheduler task runonprovision  >> ${logFile}
commit >> ${logFile}
save >> ${logFile}
#exit

#download vpn script. cannot create task schedule before file exists
/usr/bin/curl --silent 'https://raw.githubusercontent.com/rambopfc/UnifiVPNRestart/master/restartvpn.sh' > /config/scripts/restartvpn.sh
/bin/chmod +x /config/scripts/restartvpn.sh

#create vpn log file
touch /var/log/vpnlogs.log
chmod 777 /var/log/vpnlogs.log

#add task to run every day at 3am
sudo ecbo "0 3 * * * /config/scripts/restartvpn.sh" >> /etc/cron.d/vpnrestart
