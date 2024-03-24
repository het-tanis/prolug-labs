So far you've enabled UFW and verified that you could see the open ports that are allowed to be connected to on your host.

Setup a web server (apache2) on node01

Verify from controlplane that you cannot connect on port 80 to node01

Allow apache2 (port 80) to be exposed through the UFW.

Verify from controlplane that you can now connect on port 80 to node01.

<br>

### Solution
<details>
<summary>Solution</summary>
Install the apache2 web server and verify it is running.

```plain
apt -y install apache2
ss -ntulp | grep -i apache2
lsof -i :80
```{{exec}}

Exit back to controlplane and verify that you cannot connect to apache on node01

```plain
exit
```{{exec}}

```plain
curl node01:80
```{{exec}}

Why do you think you were unable to connect?

Connect back to node01 and check your list of apps in UFW

```plain
ssh node01
```{{exec}}

```plain
ufw app list 
```{{exec}}

Is this different than what you saw before? Why do you think that is?

Check for any differences between the apps that were added.

```plain
ufw app info Apache
ufw app info "Apache Full"
ufw app info "Apache Secure"
```{{exec}}

What differences do you see in these? Why might it matter?

Allow apache to be exposed through the firewall

```plain
ufw allow Apache
```{{exec}}

Exit back to controlplane and verify that you can connect to apache on node01

```plain
exit
```{{exec}}

```plain
curl node01:80
```{{exec}}

What did you see when it connected?

```plain
umount -l /mnt
```{{exec}}

Edit /etc/fstab and add the line 
` node01:/share /mnt nfs defaults 0 0 `

```plain
vi /etc/fstab
```{{exec}}

Now we use the /etc/fstab to ensure that the mount point correctly mounts on reboot. This is an old system administrator trick.

```plain
mount -a
```{{exec}}

If this works, the system is set up correctly. Let's check our mount point again.

```plain
df -h /mnt
```{{exec}}

Let's do one last write check to ensure everything is working correctly

```plain
touch /mnt/finalcheck
ls -l /mnt/finalcheck
```{{exec}}

If that's all worked, then the system is correctly set up.

</details>