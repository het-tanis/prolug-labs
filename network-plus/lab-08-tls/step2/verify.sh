#!/bin/bash
[ -s /root/tls/client.txt ] || { echo "s_client output is missing"; exit 1; }
grep -q 'subject=.*CN *= *lab.local' /root/tls/client.txt || {
  echo "client did not see the lab.local certificate"; exit 1; }
echo "TLS connection completed"
