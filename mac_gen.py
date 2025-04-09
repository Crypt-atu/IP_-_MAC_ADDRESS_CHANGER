#! /bin/python3
import random

def generate_mac_address():
    # Generate a locally administered, unicast MAC address
    mac = [0x02, random.randint(0x00, 0x7F), 
           random.randint(0x00, 0xFF), 
           random.randint(0x00, 0xFF), 
           random.randint(0x00, 0xFF), 
           random.randint(0x00, 0xFF)]
    return ':'.join(f'{octet:02x}' for octet in mac)

if __name__== '__main__':
    print(generate_mac_address())