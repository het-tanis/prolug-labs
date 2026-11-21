apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq netcat-openbsd curl >/dev/null 2>&1
mkdir -p /root/ports /srv/www
printf 'ports lab\n' > /srv/www/index.html
nohup python3 -m http.server 8080 --directory /srv/www >/dev/null 2>&1 &
ssh node01 'apt -y install nmap'
