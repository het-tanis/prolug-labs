#!/bin/bash
f=/root/subnet/calc.txt
[ -s "$f" ] || { echo "calc.txt is missing"; exit 1; }
grep -q '10.20.0.0' "$f" || { echo "network address missing"; exit 1; }
grep -qi 'broadcast' "$f" || { echo "broadcast row missing"; exit 1; }
echo "parent network calculated"
