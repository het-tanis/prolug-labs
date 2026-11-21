#!/bin/bash
ss -tulpn | grep ':9090' | grep -q '127.0.0.1:9090' || {
  echo "9090 is not bound to loopback"; exit 1; }
echo "loopback binding confirmed"
