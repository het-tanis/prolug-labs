Write the four layers you observed.

```plain
cat > /root/cap/layers.txt <<'EOF'
LINK: Ethernet II on loopback
IP: IPv4, protocol 1 (ICMP) and 6 (TCP)
TCP: port 8080, handshake and payload
APPLICATION: HTTP GET / and 200 response
EOF
cat /root/cap/layers.txt
```{exec}

Encapsulation is not an abstraction here; each line is a header you can point
at in the trace.
