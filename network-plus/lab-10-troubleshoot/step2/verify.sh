#!/bin/bash
getent hosts app.lab | grep -q '^10.99.0.1' || { echo "app.lab still resolves wrongly"; exit 1; }
[ -s /root/fix/name.txt ] || { echo "name evidence is missing"; exit 1; }
echo "name resolution fixed"
