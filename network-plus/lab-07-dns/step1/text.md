Add a static entry and query it.

```plain
printf '10.20.30.40 app.lab\n' >> /etc/hosts
getent hosts app.lab
getent hosts app.lab > /root/dns/hosts.txt
```{{exec}}

`getent` follows the same order the resolver uses: files, then DNS. `dig` would
skip the hosts file entirely.
