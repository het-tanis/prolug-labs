apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq openssh-server nftables curl >/dev/null 2>&1
ssh-keygen -A >/dev/null 2>&1
mkdir -p /srv/www /etc/ssh/sshd_config.d
printf 'firewall lab\n' > /srv/www/index.html
nohup python3 -m http.server 8080 --directory /srv/www >/dev/null 2>&1 &
touch /tmp/finished