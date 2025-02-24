Setup a nfs share for your lsof testing.

Deploy the nfs server on node01

Share out a filesystem /share to any system

Verify that the system is being shared out

<br>

### Solution
<details>
<summary>Solution</summary>
Connect to node01

```plain
ssh node01
```{{exec}}

Deploy the nfs server

```plain
apt -y install nfs-kernel-server
```{{exec}}

Verify that the server is running but nothing is being shared out.

```plain
systemctl status nfs-server.service --no-pager
ss -ntulp | grep 2049
showmount -e
```{{exec}}

Let's create a directory to share out. We also need to prep it for other systems to connect and write by changing permissions.

```plain
mkdir /share
chown nobody:nogroup /share
```{{exec}}

Add the line ``` /share *(rw,sync,no_subtree_check) ``` to /etc/exports to share out the directory.

```plain
vi /etc/exports
```{{exec}}
 
After doing this, you will need to restart the service to see the share.

```plain
systemctl restart nfs-server.service
showmount -e
```{{exec}}

Once you see the share, you're ready to move on to the client connection.

Remember to move back to controlplane node

```plain
exit
```{{exec}}

</details>