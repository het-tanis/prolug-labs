Create the pair, address it, and ping.

```plain
ip link add veth0 type veth peer name veth1
ip addr add 10.0.0.1/24 dev veth0
ip addr add 10.0.0.2/24 dev veth1
ip link set veth0 up
ip link set veth1 up
ping -c 2 10.0.0.2
```{{exec}}

This baseline has no 802.1Q header. Keep it as the control.
