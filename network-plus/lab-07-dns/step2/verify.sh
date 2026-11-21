#!/bin/bash
[ -s /root/dns/answer.txt ] || { echo "DNS answer file is missing"; exit 1; }
grep -q '10.20.30.40' /root/dns/answer.txt || { echo "dig did not return the test record"; exit 1; }
echo "local DNS answer correct"
