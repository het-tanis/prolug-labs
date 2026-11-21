Verify your current interface setup

```plain
ip addr
ip -br addr
```{{exec}}

What information do you see with these commands? 

When might you use one over the other?

Create two dummy interfaces and test both directions.

```plain
ip link add dummy0 type dummy
ip link add dummy1 type dummy
ip addr add 10.20.0.1/24 dev dummy0
ip addr add 10.20.1.1/24 dev dummy1
ip link set dummy0 up
ip link set dummy1 up
```{{exec}}

Verify your current interface setup after making all the changes

```plain
ip addr
ip -br addr
```{{exec}}

Ping the interfaces to see connectivity.

```plain
ping -c 2 10.20.0.1
ping -c 2 10.20.1.1
```{{exec}}

Dummy interfaces are local, so the ping proves the address and mask, not the
cable.
