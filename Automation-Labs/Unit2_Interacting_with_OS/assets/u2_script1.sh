#!/bin/bash

# pull the /etc/passwd file and display the first 10 lines
    echo "####### checking top of /etc/passwd file#########"
    head -n 10 /etc/passwd
# display the last 10 lines of the /etc/passwd file
    echo "####### checking bottom of /etc/passwd file##########"
    tail -n 10 /etc/passwd