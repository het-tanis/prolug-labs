Turn the router on and point both hosts at it.

```plain
ip netns exec router sysctl -w net.ipv4.ip_forward=1
ip -n ns1 route add default via 10.1.1.1
ip -n ns2 route add default via 10.2.2.1
ip -n ns1 route
ip -n ns2 route
ip netns exec router sysctl net.ipv4.ip_forward
```{{exec}}

What is shown when you look at the routes for ns1 and ns2?

Forwarding is the router's job; the hosts only need a default route.
