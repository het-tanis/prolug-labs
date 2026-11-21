#!/bin/bash
[ -s /root/cap/http.pcap ] || { echo "http.pcap is missing"; exit 1; }
tcpdump -r /root/cap/http.pcap -A 2>/dev/null | grep -q 'GET /' || {
  echo "capture contains no HTTP request"; exit 1; }
echo "HTTP capture complete"
