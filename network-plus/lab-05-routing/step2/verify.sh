#!/bin/bash
[ "$(ip netns exec router sysctl -n net.ipv4.ip_forward)" = "1" ] || {
  echo "router forwarding is disabled"; exit 1; }
ip -n ns1 route | grep -q '^default via 10.1.1.1' || { echo "ns1 default route missing"; exit 1; }
ip -n ns2 route | grep -q '^default via 10.2.2.1' || { echo "ns2 default route missing"; exit 1; }
echo "forwarding and routes configured"
