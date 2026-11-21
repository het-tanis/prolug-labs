#!/bin/bash
ip -4 addr show veth0 | grep -q '10.0.0.1/24' || { echo "veth0 address missing"; exit 1; }
ping -c 1 -W 1 10.0.0.2 >/dev/null 2>&1 || { echo "untagged ping failed"; exit 1; }
echo "untagged baseline works"
