Start `s_server` and connect with `s_client`.

```plain
cd /root/tls
nohup openssl s_server -accept 4433 -cert lab.crt -key lab.key -www >/dev/null 2>&1 &
sleep 1
openssl s_client -connect 127.0.0.1:4433 -servername lab.local </dev/null \
  > /root/tls/client.txt 2>&1
grep -E 'subject=|Verify return code' /root/tls/client.txt
```{{exec}}

The verification error is expected: the certificate is self-signed and not in a
trust store.
