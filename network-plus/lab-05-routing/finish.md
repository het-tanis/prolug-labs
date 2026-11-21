## What good looks like

- A router is a host with two interfaces and forwarding enabled.
- Hosts need a route; the router needs both connected networks.
- `ip route get` answers "which path would this packet take?"

Clean up with `ip netns del ns1 ns2 router`.
