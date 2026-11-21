Verify your current interface setup

```plain
ip addr
ip -br addr
```{{exec}}

Create the namespaces and the veth pair.

```plain
ip netns add ns1
ip netns add ns2
ip link add veth1 type veth peer name veth2
ip link set veth1 netns ns1
ip link set veth2 netns ns2
ip -n ns1 link set lo up
ip -n ns2 link set lo up
ip -n ns1 link set veth1 up
ip -n ns2 link set veth2 up
ip -n ns1 addr add 172.16.0.1/24 dev veth1
ip -n ns2 addr add 172.16.0.2/24 dev veth2
```{{exec}}

Validate what you just built

```plain
ip addr
ip -br addr
```{{exec}}

Each namespace sees only its own end of the cable.
