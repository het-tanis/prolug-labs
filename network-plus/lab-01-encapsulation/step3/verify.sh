#!/bin/bash
f=/root/cap/layers.txt
[ -s "$f" ] || { echo "layers.txt is missing"; exit 1; }
for layer in LINK IP TCP APPLICATION; do
  grep -qi "$layer" "$f" || { echo "layers.txt is missing $layer"; exit 1; }
done
echo "layers labelled"
