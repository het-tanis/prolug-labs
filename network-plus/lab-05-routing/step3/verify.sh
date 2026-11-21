#!/bin/bash
ip netns exec ns1 ping -c 2 -W 1 10.2.2.2 >/dev/null 2>&1 || {
  echo "ns1 cannot reach ns2 through the router"; exit 1; }
echo "end-to-end path works"
