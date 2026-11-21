Ping across the router and inspect the path.

```plain
ip netns exec ns1 ping -c 3 10.2.2.2
ip netns exec ns1 ip route get 10.2.2.2
```{{exec}}

What does the command `ip route get` do in your network? Why is this important for troubleshooting?

If the ping fails, check forwarding first, then the default routes, then the
interface state. Work the layers in order.
