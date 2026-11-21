Start a capture, generate traffic, then read it back.

```plain
mkdir -p /root/cap
timeout 15 tcpdump -i lo -c 4 -w /root/cap/icmp.pcap icmp &
sleep 1
ping -c 3 127.0.0.1
```{{exec}}

What is happening in the above commands?

What is the 127.0.0.1 address?

What does the -c option cause ping to do? 

How does this vary from the default behavior?

```
tcpdump -r /root/cap/icmp.pcap -nn
```{{exec}}

What can you see with the output above?

The capture stops after four packets; `timeout` prevents a hung step if the
traffic never arrives.
