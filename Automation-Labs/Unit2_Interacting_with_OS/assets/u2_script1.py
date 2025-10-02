#!/usr/bin/python3

# This script displays the first and last 10 lines of the /etc/passwd file
with open("/etc/passwd", "r") as f:
    lines = f.readlines()
    print("".join(lines[:10]))
    print("...")
    print("".join(lines[-10:]))

#This script displays just the last 10 lines of the /etc/passwd file
with open("/etc/passwd", "r") as f:
    lines = f.readlines()
    print("".join(lines[-10:]))