#!/bin/bash
[ -s /root/dns/dns.pcap ] || { echo "dns.pcap is missing"; exit 1; }
tcpdump -r /root/dns/dns.pcap -nn 2>/dev/null | grep -q '\.53' || {
  echo "capture has no DNS traffic"; exit 1; }
echo "DNS query captured"
