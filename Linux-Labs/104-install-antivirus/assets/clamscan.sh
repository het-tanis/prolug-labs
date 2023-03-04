#!/bin/bash
# written by: Author
# Date: 07/15/2019
# Description: Log files from ClamAV Scanning
#
DAILYLOGFILE="/var/log/clamav/clamav-$(date +'%Y-%m-%d').log";
LOGFILE="/var/log/clamav/clamav.log";

#Scanning and logging to current logfile with a very high nice value
clamscan -ri / &> "$LOGFILE"

#Copying to daily log file for history tracking
cp $LOGFILE $DAILYLOGFILE

#Gather Metrics to use later
scanDirectories=`tail -20 $DAILYLOGFILE | grep -i directories | awk '{print $NF}'`
scanFiles=`tail -20 $DAILYLOGFILE | grep -i "scanned files" | awk '{print $NF}'`
infectedFiles=`tail -20 $DAILYLOGFILE | grep -i infected | awk '{print $NF}'`
runTimeSeconds=`tail -20 $DAILYLOGFILE | grep -i time | awk '{print $2}' | awk -F. '{print $1}'`

#Report out what metrics you have
echo "Directories: $scanDirectories Files: $scanFiles Infected: $infectedFiles Time: $runTimeSeconds"

exit 0