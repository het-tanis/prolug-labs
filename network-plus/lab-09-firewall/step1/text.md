Test a service on port 8080 before the rules are applied.

```plain
curl -s --max-time 2 http://127.0.0.1:8080 >/dev/null && echo "before: reachable"
```{{exec}}

Create a table and chain, then allow SSH and block 8080.

```plain
nft add table inet filter
nft add chain inet filter input '{ type filter hook input priority 0; policy accept; }'
nft add rule inet filter input tcp dport 22 accept
nft add rule inet filter input tcp dport 8080 drop
nft list chain inet filter input
```{{exec}}

Do you see the policies and filters as you expect?

`policy accept` keeps the lab reachable; in production you would default deny
and add explicit allows.
