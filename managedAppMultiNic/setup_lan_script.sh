#!/bin/sh
IPADDRESS=`eval cat /var/lib/cloud/network.cfg | jq -r '.vnfMetadata.interface[] | select(.vmSwitchType == "LAN") | .ipConfigurations[].ipAddress'`
NETWORK=`eval cat /var/lib/cloud/network.cfg | jq -r --arg IPADDRESS $IPADDRESS '.network.interface[].ipv4 | select(.ipAddress[].privateIpAddress == $IPADDRESS) | .subnet[].address'`
PREFIX=`eval cat /var/lib/cloud/network.cfg | jq -r --arg IPADDRESS $IPADDRESS '.network.interface[].ipv4 | select(.ipAddress[].privateIpAddress == $IPADDRESS) | .subnet[].prefix'`
/bin/nmcli connection modify 'System eth1' ipv4.method manual ipv4.addr $IPADDRESS/$PREFIX connection.zone trusted