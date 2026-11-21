#!/bin/bash
cd /root/tls || exit 1
[ -s lab.crt ] && [ -s lab.key ] || { echo "certificate or key is missing"; exit 1; }
openssl x509 -in lab.crt -noout -subject | grep -q 'CN *= *lab.local' || {
  echo "certificate CN is not lab.local"; exit 1; }
[ "$(stat -c %a lab.key)" = "600" ] || { echo "private key must be 600"; exit 1; }
echo "certificate ready"
