#!/bin/bash
ping -c 2 -W 1 10.99.0.1 >/dev/null 2>&1 || { echo "target still unreachable"; exit 1; }
ip route | grep -q 'blackhole 10.99.0.0/24' && { echo "blackhole route still present"; exit 1; }
echo "route repaired"
