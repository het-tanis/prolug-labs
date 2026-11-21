# Route between two networks

Two hosts on different subnets cannot talk without a router. You will build one
out of a network namespace, then prove the path.

Topology: `ns1 10.1.1.2/24` — `router 10.1.1.1` and `10.2.2.1` — `ns2 10.2.2.2/24`.
