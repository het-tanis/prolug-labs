## What good looks like

- CIDR arithmetic is checkable: network, broadcast, host range.
- A subnet plan is a document before it is a configuration.
- Dummy interfaces let you test addressing without touching the real NIC.

Remove the dummies with `ip link del dummy0` and `ip link del dummy1`.
