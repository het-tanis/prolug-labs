Capture port 4433 during a second connection.

```plain
timeout 10 tcpdump -i lo -c 10 -w /root/tls/tls.pcap 'tcp port 4433' &
sleep 1
openssl s_client -connect 127.0.0.1:4433 -servername lab.local </dev/null >/dev/null 2>&1
wait
tcpdump -r /root/tls/tls.pcap -nn | head
```{{exec}}

The payload is encrypted; the handshake metadata is not.
