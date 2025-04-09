#! /bin/python3
import random

def ip_generator():
    # Pick a private IP range
    first_octet = random.choice([10, 172, 192])
    
    if first_octet == 10:
        ip = [10, random.randint(0, 255), random.randint(0, 255), random.randint(1, 254)]
    elif first_octet == 172:
        ip = [172, random.randint(16, 31), random.randint(0, 255), random.randint(1, 254)]
    else:
        ip = [192, 168, random.randint(0, 255), random.randint(1, 254)]

    return ".".join(str(octet) for octet in ip)

if __name__ == "__main__":
    print(ip_generator())
