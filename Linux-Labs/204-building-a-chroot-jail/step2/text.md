You've setup the jail and verified that there is little to no functionality in the jail. We need to make the jail useful for a user. We have to give the basic pieces for the user to have functionality we want to give them.

Copy in the correct system files for user functionality.

Copy in the correct binaries you want to give them: curl, and ssh. (you already gave bash)

Copy in the link libraries needed for curl, and ssh to work properly. (you already gave them bash)

Copy in the right environment files and home directory that allow a user session to run commands properly.

<br>

### Solution
<details>
<summary>Solution</summary>
Copy over the system files.

Inspect sudoers file.
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

You've set up your environment so hit submit to move on and test.

</details>