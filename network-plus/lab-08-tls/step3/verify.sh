#!/bin/bash
[ -s /root/tls/tls.pcap ] || { echo "tls.pcap is missing"; exit 1; }
tcpdump -r /root/tls/tls.pcap -nn 2>/dev/null | grep -q '4433' || {
  echo "capture has no traffic on 4433"; exit 1; }
echo "handshake captured"
