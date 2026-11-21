Create three namespaces and two veth pairs.

```plain
for n in ns1 ns2 router; do ip netns add $n; ip -n $n link set lo up; done
ip link add veth1 type veth peer name r1
ip link add veth2 type veth peer name r2
ip link set veth1 netns ns1;  ip link set r1 netns router
ip link set veth2 netns ns2;  ip link set r2 netns router
ip -n ns1 addr add 10.1.1.2/24 dev veth1; ip -n ns1 link set veth1 up
ip -n ns2 addr add 10.2.2.2/24 dev veth2; ip -n ns2 link set veth2 up
ip -n router addr add 10.1.1.1/24 dev r1; ip -n router link set r1 up
ip -n router addr add 10.2.2.1/24 dev r2; ip -n router link set r2 up
```{{exec}}

Each host is directly connected to one router interface only.
