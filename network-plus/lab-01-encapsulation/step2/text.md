Capture the TCP exchange for one HTTP request.

```plain
timeout 20 tcpdump -i lo -c 12 -w /root/cap/http.pcap 'tcp port 8080' &
sleep 1
curl -s http://127.0.0.1:8080 >/dev/null
sleep 1
```{exec}

Now run the curl command to verify output

```plain
curl -s http://127.0.0.1:8080
```{exec}

What do you see when you run the curl command?

```plain
tcpdump -r /root/cap/http.pcap -nn -A | head -20
```{exec}


You should see the TCP handshake, the `GET`, and the response.
