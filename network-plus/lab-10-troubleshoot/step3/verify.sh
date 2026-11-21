#!/bin/bash
tc qdisc show dev dummy0 2>/dev/null | grep -q netem && {
  echo "netem qdisc is still attached"; exit 1; }
avg=$(ping -c 3 -W 1 10.99.0.1 | awk -F'/' '/rtt|round-trip/ {print $5}')
[ -n "$avg" ] || { echo "could not measure ping"; exit 1; }
awk -v a="$avg" 'BEGIN{exit !(a < 50)}' || { echo "latency is still ${avg} ms"; exit 1; }
echo "latency removed (${avg} ms)"
