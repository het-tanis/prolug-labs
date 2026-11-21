#!/bin/bash
f=/root/subnet/plan.txt
[ -s "$f" ] || { echo "plan.txt is missing"; exit 1; }
for n in 0 1 2 3; do
  grep -q "10.20.$n.0/24" "$f" || { echo "missing 10.20.$n.0/24"; exit 1; }
done
echo "subnet plan complete"
