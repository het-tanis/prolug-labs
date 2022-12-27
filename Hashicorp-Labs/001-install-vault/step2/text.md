So far you've set up an NFS server and share, now we have to connect to it as another system.

Install the nfs-common client.

Mount the node01:/share to /mnt to test.

Make the node01:/share to /mnt a permanent setting in /etc/fstab.

<br>

### Solution
<details>
<summary>Solution</summary>
Install the nfs-common client

```plain
apt -y install nfs-common
```{{exec}}

Test the mount point to verify we can connect.

```plain
mount node01:/share /mnt
```{{exec}}

Let's examine the mount point in our system.

```plain
df -h /mnt
```{{exec}}

Let's verify we can write into this directory.

```plain
touch /mnt/test1
ls -l /mnt
```{{exec}}

Remove the mount point so we can mount it via /etc/fstab

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