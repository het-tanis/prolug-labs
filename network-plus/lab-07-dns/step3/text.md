Capture UDP/53 while you query again.

```plain
timeout 10 tcpdump -i any -c 4 -w /root/dns/dns.pcap udp port 53 &
sleep 1
dig +short lab.test @127.0.0.1 >/dev/null
tcpdump -r /root/dns/dns.pcap -nn | head
```{{exec}}

If the capture is empty, the query went somewhere else; check the resolver and
the port.
