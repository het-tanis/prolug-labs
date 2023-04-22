You have installed ClamAV in support of your team's PCI-DSS directive by security. You know that antivirus works on signatures, so update the signature database and then verify that the scanning engine works properly.

Update signature database (Freshclam).

Scan your system for vulnerabilities.

<br>

### Solution
<details>
<summary>Solution</summary>

Stop clamav-freshclam so that you can update manually.

```plain
systemctl status clamav-freshclam --no-pager
systemctl stop clamav-freshclam
```{{exec}}

Manually update your antivirus database

```plain
freshclam
```{{exec}}

What do you see in the output? What is the relevant information?

Turn on and enable automatic daily antivirus signature updates

```plain
systemctl enable clamav-freshclam --now
```{{exec}}

Run your first scan against a directory

```plain
time clamscan --infected --remove --recursive --log=/var/log/clamav/clamav.log /etc
```{{exec}}

How long did the scan take? Is the system time the same as the scanner time?

Verify that file was written out to

```plain
cat /var/log/clamav/clamav.log
```{{exec}}

With all of these steps complete we're ready to move on to the automation piece.

</details>