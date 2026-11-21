#!/bin/bash
ip -d link show veth0.10 | grep -q 'vlan protocol 802.1Q id 10' || {
  echo "veth0.10 is not VLAN 10"; exit 1; }
ping -c 1 -W 1 10.10.10.2 >/dev/null 2>&1 || { echo "VLAN ping failed"; exit 1; }
echo "VLAN 10 works"
