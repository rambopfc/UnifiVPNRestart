#!/bin/sh

/opt/vyatta/bin/vyatta-op-cmd-wrapper restart vpn >> /var/log/vpnlogs.log
echo $(date -u) "VPN Restarted" >> /var/log/vpnlogs.log
