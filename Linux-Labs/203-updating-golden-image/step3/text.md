We've recently chosen to remove all containerd software to prevent our developers from launching random containers anywhere in our environment. We have also had to remove bzip because it is an obsolete software package that gzip completely supersedes.

Verify that containerd is on the system and running.

Verify that bzip is on the system.

Remove the packages that should not be there and then verify they are gone.

<br>

### Solution
<details>
<summary>Solution</summary>
Check for containerd, if it is installed and running on your system.

```plain
ss -ntulp | grep -i container
systemctl status containerd --no-pager
```{{exec}}

Is it there, and is it running?

Check for bzip on your system.

```plain
dpkg -l | grep -i bzip2
which bzip2
```{{exec}}

Is bzip2 installed on your system? Can you find the executible?

Remove the unwanted packages

```plain
apt -y remove bzip2 containerd
```{{exec}}

Verify that nothing is running or installed on your system that doesn't meet your system requirements.

```plain
ss -ntulp | grep -i container
systemctl status containerd --no-pager
```{{exec}}

```plain
dpkg -l | grep -i bzip2
which bzip2
```{{exec}}

If these are removed, you've cleaned up your system to meet the new requirements.


</details>