Use the service, then stop both listeners.

```plain
curl -s http://127.0.0.1:8080 | head -1
pkill -f 'http.server 8080'
pkill -f 'http.server 9090'
sleep 1
ss -tulpn | grep -E '8080|9090' || echo "both ports closed"
```{{exec}}

What does the `grep -E` do in this case?


Closing the process is the cleanup; the socket disappears with it.
