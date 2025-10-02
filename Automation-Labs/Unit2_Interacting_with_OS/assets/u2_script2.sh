#!/bin/bash

#Generate a log with today's date tagged on it.
    echo "Generating a log file with today's date in it"
    date >> ~/log.`date +%F`.txt
    echo "Log file created at ~/log.`date +%F`.txt"

#Display that log file
    echo "Displaying the log file"
    cat ~/log.`date +%F`.txt

