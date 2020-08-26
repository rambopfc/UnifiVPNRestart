#!/bin/sh

/opt/vyatta/bin/vyatta-op-cmd-wrapper restart vpn
echo $(date -u) "VPN Restarted" >> /var/log/vpnlogs.log
