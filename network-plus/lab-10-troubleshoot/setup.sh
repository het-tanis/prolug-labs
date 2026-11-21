mkdir -p /root/fix
ip link add dummy0 type dummy 2>/dev/null || true
ip addr add 10.99.0.1/32 dev dummy0 2>/dev/null || true
ip link set dummy0 up
ip route add blackhole 10.99.0.0/24 2>/dev/null || true
printf '10.99.0.99 app.lab\n' >> /etc/hosts
tc qdisc add dev dummy0 root netem delay 120ms 2>/dev/null || true
