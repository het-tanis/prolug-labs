## What good looks like

- `ss` is the service truth; Other tools like `nmap` show an outside view.
- Bind address is a design decision.
- Stop what you start so the next check is clean.

Compare `ss -tulpn` with an external scan: the loopback service should not
appear in the scan.
