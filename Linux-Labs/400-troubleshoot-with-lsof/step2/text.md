So far you've set up an NFS server and share, now we have to connect to it from controlplane

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


</details>