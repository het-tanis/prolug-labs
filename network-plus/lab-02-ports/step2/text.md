Start a second service bound to `127.0.0.1` and confirm the
bind address.

```plain
nohup python3 -m http.server 9090 --bind 127.0.0.1 --directory /srv/www >/dev/null 2>&1 &
sleep 1
ss -tulpn | grep 9090
curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:9090
```{{exec}}

`0.0.0.0:9090` would expose it on every interface; `127.0.0.1:9090` does not.
