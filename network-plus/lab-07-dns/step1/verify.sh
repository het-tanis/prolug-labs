#!/bin/bash
getent hosts app.lab | grep -q '10.20.30.40' || { echo "hosts entry not resolving"; exit 1; }
[ -s /root/dns/hosts.txt ] || { echo "hosts evidence is missing"; exit 1; }
echo "hosts file resolution works"
