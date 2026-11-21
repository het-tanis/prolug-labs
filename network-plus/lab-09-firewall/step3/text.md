Add a drop-in and validate the effective configuration.

```plain
cat >/etc/ssh/sshd_config.d/99-lab.conf <<'EOF'
PermitRootLogin no
PasswordAuthentication no
KbdInteractiveAuthentication no
EOF
sshd -t
sshd -T | grep -E 'permitrootlogin|passwordauthentication'
```{{exec}}

`sshd -T` is what the daemon will use; the drop-in alone is only intent, nothing has chaned to the currently running ssh daemon.

Do we see the values of the configuration as we expect? Why or why not?

Where are these values set in the system currently?

```plain
echo "checking /etc/ssh/sshd_config"
cat /etc/ssh/sshd_config

echo "checking all the files under /etc/ssh/sshd_config.d"
for file in $(ls -l /etc/ssh/sshd_config.d/*)
do 
  echo "Checking $file"
  cat $file
done
```{{exec}}

Why do you think there's a difference?