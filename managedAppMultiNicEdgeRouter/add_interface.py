#!/usr/bin/env python3
import argparse
import netifaces
import yaml
parser = argparse.ArgumentParser(description='Add Ipconfiguration to Second NIC')
parser.add_argument("--ipaddress", required=True)
parser.add_argument("--subnet", required=True)
args = parser.parse_args()
interface_details = []
for interface in netifaces.interfaces():
    if interface not in ["lo",netifaces.gateways()['default'][netifaces.AF_INET][1]]:
        interface_details = interface_details + [{ "interface_name": interface, 
            "interface_mac": netifaces.ifaddresses(interface)[netifaces.AF_LINK][0]['addr']}]
prefix="%s/%s" % (args.ipaddress, args.subnet.split('/')[1])
if len(interface_details) == 2:
    if interface_details[0]["interface_mac"] == interface_details[1]["interface_mac"]:
        second_net={"network":{"ethernets": {},"version": 2}}
        second_net["network"]["ethernets"][interface_details[0]['interface_name']]={
            "dhcp4": False,
            "addresses": [prefix],
            "match": {
                "macaddress": interface_details[0]['interface_mac']
            },
            "set-name": interface_details[0]['interface_name']
        }
        with open(r'/etc/netplan/10-second-net.yaml', 'w') as file:
            yaml.dump(second_net, file)
    else:
        print("Interface 4 not setup in SLAVE mode, i.e. mac adresses are not same for Interfaces 3 and 4, exiting...")        
else:
        print("More than 2 interfaces found beyond lo and default, exiting...")