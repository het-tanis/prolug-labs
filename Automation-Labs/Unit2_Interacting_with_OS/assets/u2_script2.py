#!/usr/bin/python3

#This script reads through /etc/passwd and displays the user name if /bin/bash is the shell.
with open("/etc/passwd", "r") as f:
    lines = f.readlines()
    for line in lines:
        if line.strip().endswith("/bin/bash"):
            print(line.split(":")[0])
