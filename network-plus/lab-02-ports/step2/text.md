Start a second service bound to `127.0.0.1` and confirm the
bind address.

```plain
nohup python3 -m http.server 9090 --bind 127.0.0.1 --directory /srv/www >/dev/null 2>&1 &
sleep 1
ss -tulpn | grep 9090
curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:9090
```{{exec}}

```plain
ssh node01
```{{exec}}

Scan against controlplane node to verify that the ports do not appear open from an external connection

```plain
nmap -p 22,80,443,8080,9090 <target-ip>
```{{exec}}

Do you see the target ports open?

Exit back to controlplane node and verify the exposed ports.

```plain
exit
```{{exec}}

```plain
ss -tulpn | grep 9090
```{{exec}}


`0.0.0.0:9090` would expose it on every interface; `127.0.0.1:9090` does not.
