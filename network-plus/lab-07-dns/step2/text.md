Start `dnsmasq` on loopback with a test record and query it.

```plain
nohup dnsmasq --no-daemon --listen-address=127.0.0.1 --bind-interfaces --port=53 --address=/lab.test/10.20.30.40 >/dev/null 2>&1 &
sleep 1
dig +short lab.test @127.0.0.1 | tee /root/dns/answer.txt
```{{exec}}

The answer comes from the server, not from `/etc/hosts`.

Validate by checking /etc/hosts

```plain
cat /etc/hosts
```{{exec}}