Check network traffic to our system.

Look at the throughput to your interfaces.

Create a file /root/ubuntu.pcap with 200 packets that can be read by wireshark later. (*We don't look at it in the lab. We just create it)

<br>

### Solution
<details>
<summary>Solution</summary>

Check network throughput to your system for 20 seconds
```plain
ifstat 2 10
```{{exec}}

Note: There is very little traffic (in size) into or out of your system.

Do a tcpdump to inspect the actual traffic into your system. Capture 1000 packets against your enp1s0 interface.

```plain
tcpdump -ni enp1s0 -s0 -c 1000
```{{exec}}

Let's generate a .pcap file that can be used by wireshark to inspect traffic. (We don't have wireshark on this system)

```plain
for i in $(seq 1 5); do ping -c 10 www.google.com & done; tcpdump -ni enp1s0 -s0 -c 200 -w $(hostname).pcap
```{{exec}}

Verify the size and creation of the file.
```plain
ls -lh /root/ubuntu.pcap
```{{exec}}

</details>