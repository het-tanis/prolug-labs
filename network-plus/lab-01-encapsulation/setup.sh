apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq tcpdump curl >/dev/null 2>&1
mkdir -p /root/cap /srv/www
printf 'network-plus lab\n' > /srv/www/index.html
nohup python3 -m http.server 8080 --directory /srv/www >/dev/null 2>&1 &
