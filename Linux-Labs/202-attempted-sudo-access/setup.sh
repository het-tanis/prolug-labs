useradd -m -p 1234 baduser 
echo "* * * * * root su - baduser -c 'echo \"1234\" | sudo -S ls /root'" > /var/spool/cron/crontabs/root
chown root:crontab /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root

touch /tmp/finished
