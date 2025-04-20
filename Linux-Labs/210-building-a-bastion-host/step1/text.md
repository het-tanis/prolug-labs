Your team is planning on building a bastion system. You have tested functionality of the jail in a previous lab. For this lab you are going to simulate an air-gapped system connection via a bastion.

![bastion](../assets/bastion.png)

Build a jail on node01 at `/var/chroot/`.

Add basic framework to the jail so that you can populate it with functionality.

Change your root to /var/chroot and see what functionality you have.


<br>

### Solution
<details>
<summary>Solution</summary>

Ensure you are on node01.

```plain
ssh node01
```{{exec}}
Create the chroot filesystem.

```plain
mkdir /var/chroot
```{{exec}}

Create the directory structure of the jail.

```plain
mkdir -p /var/chroot/{bin,lib64,dev,etc,home,usr/bin,lib/x86_64-linux-gnu}
```{{exec}}

Check the directories have been created.

```plain
ls -l /var/chroot
```{{exec}}

What directories do you see? Is there anything about these directories that you know about that would make sense to give a user?

Move in the minimum executables for chroot to work properly.

```plain
cp /usr/bin/bash /var/chroot/bin/bash
```{{exec}}

The binary cannot work properly without the link libraries. Copy those in to get basic bash shell functionality.

```plain
for package in $(ldd /bin/bash | awk '{print $(NF -1)}'); do cp $package /var/chroot/$package; done
```{{exec}}

Copy over the system files.

```plain
for file in passwd group nsswitch.conf hosts; do cp /etc/$file /var/chroot/etc/$file; done
```{{exec}}

Now that you've pulled those base files over copy in the binaries of commands we're going to give the jailed user.

```plain
for binary in bash ssh curl; do cp /usr/bin/$binary /var/chroot/usr/bin/$binary; done
```{{exec}}

Now that those are in the correct place, everything that those binaries use as a link library can be found with the ldd command. Test this out.

```plain
ldd /usr/bin/bash
```{{exec}}

This shows all the link libaries for bash. We need to copy them in for curl and ssh, we did bash in the last step.

```plain
for package in $(ldd /usr/bin/ssh | awk '{print $(NF -1)}'); do cp $package /var/chroot/$package; done
```{{exec}}

```plain
for package in $(ldd /usr/bin/curl | awk '{print $(NF -1)}'); do cp $package /var/chroot/$package; done
```{{exec}}

You can ignore the error about stat-ing the one file linux-vdso.so.1 it won't affect the rest of the lab.

Now that these files have been pushed, environment files have to exist for the bash shell to run properly.

```plain
mknod -m 666 /var/chroot/dev/null c 1 3
```{{exec}}

```plain
mknod -m 666 /var/chroot/dev/tty c 5 0
```{{exec}}

```plain
mknod -m 666 /var/chroot/dev/zero c 1 5
```{{exec}}

```plain
mknod -m 666 /var/chroot/dev/random c 1 8
```{{exec}}

```plain
mknod -m 666 /var/chroot/dev/urandom c 1 9
```{{exec}}

There's one last set of libraries that are needed for your user to have network functionality, they are the nss files. Copy them over.

```plain
cp -r /lib/x86_64-linux-gnu/*nss* /var/chroot/lib/x86_64-linux-gnu/
```{{exec}}

Exit node01

```plain
exit
```{{exec}}

You've set up your environment so hit submit to move on and start building the bastion portion.

</details>
