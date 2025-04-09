#! /bin/bash
#Locating the Dir of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#Storing the values while making a fucntion call from another script
mac_addr=$(python3 "$SCRIPT_DIR/mac_gen.py")
ip_addr=$(python3 "$SCRIPT_DIR/ip_gen.py")

#This will prompt the user for the device name
echo "Enter the device interface name:"
read interface

echo "Attempting Ip and Mac Address"

#Changing the Ip address
sudo ifconfig $interface $ip_addr

#Changing the mac address
sudo ifconfig $interface down
sudo ifconfig $interface hw ether $mac_addr
sudo ifconfig $interface up

echo "Mac and Ip Address has been changed"