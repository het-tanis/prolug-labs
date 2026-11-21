#!/bin/bash
ip -4 addr show dummy0 | grep -q '10.20.0.1/24' || { echo "dummy0 address missing"; exit 1; }
ip -4 addr show dummy1 | grep -q '10.20.1.1/24' || { echo "dummy1 address missing"; exit 1; }
ping -c 1 -W 1 10.20.0.1 >/dev/null 2>&1 || { echo "dummy0 does not answer"; exit 1; }
ping -c 1 -W 1 10.20.1.1 >/dev/null 2>&1 || { echo "dummy1 does not answer"; exit 1; }
echo "subnets configured and reachable"
