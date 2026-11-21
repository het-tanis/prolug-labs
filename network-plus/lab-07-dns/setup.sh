apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq dnsutils dnsmasq tcpdump >/dev/null 2>&1
mkdir -p /root/dns
touch /tmp/finished