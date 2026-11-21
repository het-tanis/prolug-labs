#!/bin/bash
[ -s /root/vlan/vlan.pcap ] || { echo "vlan.pcap is missing"; exit 1; }
tcpdump -r /root/vlan/vlan.pcap -e 2>/dev/null | grep -q 'vlan 10' || {
  echo "capture has no vlan 10 tag"; exit 1; }
echo "tag captured"
