#!/bin/bash
nft list chain inet filter input 2>/dev/null | grep -q 'dport 8080 drop' || {
  echo "no drop rule for 8080"; exit 1; }
nft list chain inet filter input 2>/dev/null | grep -q 'dport 22 accept' || {
  echo "no allow rule for 22"; exit 1; }
echo "input chain configured"
