#!/bin/bash
[ -s /root/ports/listeners.txt ] || { echo "listener report is missing"; exit 1; }
grep -q ':8080' /root/ports/listeners.txt || { echo "8080 is not listening"; exit 1; }
echo "listener inventory captured"
