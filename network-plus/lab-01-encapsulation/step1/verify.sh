#!/bin/bash
[ -s /root/cap/icmp.pcap ] || { echo "icmp.pcap is missing"; exit 1; }
tcpdump -r /root/cap/icmp.pcap 2>/dev/null | grep -q ICMP || {
  echo "capture contains no ICMP"; exit 1; }
echo "ICMP capture complete"
