#! /bin/bash
#Author Crypt

# ========== [COLOR STYLING ] ==========
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
RESET=$(tput sgr0)

#=========[Banner]==============
echo "${CYAN}${BOLD}"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃     🔧  IP & MAC ADDRESS CHANGER     ┃"
echo "┃           by CRYPT ☠️                 ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo "${RESET}"

# ========== [ TYPEWRITER FUNCTION ] ==========
typewriter() {
    for ((i=0; i<${#1}; i++)); do
        echo -n "${1:$i:1}"
        sleep 0.01
    done
    echo
}

#Locating the Dir of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#Storing the values while making a fucntion call from another script
mac_addr=$(python3 "$SCRIPT_DIR/mac_gen.py")
ip_addr=$(python3 "$SCRIPT_DIR/ip_gen.py")

#Prompting the user to pick the interface based on the interfaces on the system
typewriter "${CYAN} List of interfaces in your device[.] ${RESET}"

echo
ip link show

#This will prompt the user for the device name
typewriter "${GREEN}[?] Enter the device interface name from the above interface list, you want to change: ${RESET}"
read interface

typewriter "${GREEN}Attempting Change.......... ${RESET}"

#Changing the Ip address
sudo ifconfig $interface $ip_addr

#Changing the mac address
sudo ifconfig $interface down
sudo ifconfig $interface hw ether $mac_addr
sudo ifconfig $interface up

typewriter "${GREEN}Mac and IP Address Changed ${RESET}"