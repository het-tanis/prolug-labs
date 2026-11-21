Ping across the virtual cable and inspect the routes.

```plain
ip netns exec ns1 ping -c 2 172.16.0.2
ip netns exec ns1 ip route
ip netns exec ns2 ip route
```{{exec}}

The route is directly connected; no gateway is involved.
