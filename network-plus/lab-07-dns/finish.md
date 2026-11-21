## What good looks like

- `/etc/hosts` wins before DNS; `dig` bypasses it.
- A resolver test needs both the answer and the path.
- Capture on port 53 when the answer and the expectation disagree.

Stop dnsmasq with `pkill dnsmasq` when finished.
