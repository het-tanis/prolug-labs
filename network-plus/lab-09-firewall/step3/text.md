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
