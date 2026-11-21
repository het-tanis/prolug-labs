## What good looks like

- The tag lives on the frame; the VLAN id lives in the interface.
- `ip -d link` is the local truth; `tcpdump -e` is the wire truth.
- A veth pair lets you practise switching without a physical switch.

Clean up with `ip link del veth0`.
