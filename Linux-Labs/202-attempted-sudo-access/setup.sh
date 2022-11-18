useradd -m baduser
cp /root/sudo_attempts.sh /home/baduser/sudo_attempts.sh
chmod baduser:baduser /home/baduser/sudo_attempts.sh

echo "* * * * * baduser /home/baduser/sudo_attempts.sh" > /var/spool/cron/crontabs/baduser
chown baduser:crontab /var/spool/cron/crontabs/baduser
chmod 640 /var/spool/cron/crontabs/baduser

touch /tmp/finished
