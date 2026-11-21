Capture the tagged ping and prove the header is present.

```plain
timeout 15 tcpdump -i veth0 -c 6 -e -w /root/vlan/vlan.pcap vlan &
sleep 1
ping -c 3 10.10.10.2
wait
tcpdump -r /root/vlan/vlan.pcap -e -nn
```{{exec}}

The read-back must show `vlan 10`. An untagged capture would show the frame
without that field.
