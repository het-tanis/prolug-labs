## What good looks like

- `ss` is the service truth; `nmap` is the outside view.
- Bind address is a design decision.
- Stop what you start so the next check is clean.

Compare `ss -tulpn` with an external scan: the loopback service should not
appear in the scan.
