#!/bin/bash
ip netns exec ns1 ping -c 2 -W 1 172.16.0.2 >/dev/null 2>&1 || {
  echo "ns1 cannot reach ns2"; exit 1; }
echo "namespaces can reach each other"
