Take the link down, watch the failure, then bring it back.

```plain
ip -n ns1 link set veth1 down
ip netns exec ns1 ping -c 1 -W 1 172.16.0.2 || echo "expected failure"
ip -n ns1 link set veth1 up
sleep 1
ip netns exec ns1 ping -c 2 172.16.0.2
```{{exec}}

A downed link is a layer-1 failure: no route change will fix it.
