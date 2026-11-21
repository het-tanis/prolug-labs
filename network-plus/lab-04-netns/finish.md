## What good looks like

- Namespaces isolate interfaces and routes without extra hardware.
- A veth pair is a cable; one end down breaks the path.
- Containers and overlays use exactly this abstraction.

Clean up with `ip netns del ns1` and `ip netns del ns2`.
