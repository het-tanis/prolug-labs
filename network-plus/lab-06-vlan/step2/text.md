Create a VLAN interface on each end and address the pair.

```plain
ip link add link veth0 name veth0.10 type vlan id 10
ip link add link veth1 name veth1.10 type vlan id 10
ip addr add 10.10.10.1/24 dev veth0.10
ip addr add 10.10.10.2/24 dev veth1.10
ip link set veth0.10 up
ip link set veth1.10 up
ping -c 2 10.10.10.2
ip -d link show veth0.10
```{{exec}}

`ip -d` shows the VLAN id and protocol; the `.10` in the name is only a label.
