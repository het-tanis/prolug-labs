Check filesystem type and mount points

Echo the filesystem type of the root partition into /root/fstype

Echo the name of the file that defines all the mount points into /root/mountinfo

<br>

### Solution
<details>
<summary>Solution</summary>
Check what partition the root (/) filesystem is mounted from.

```plain
mount | grep vda
```{{exec}}

Check the filesystem written to that partition.

Let's use another command to see that information another way.
```plain
blkid /dev/vda1
```{{exec}}

So you see the type is ext4. Write that out to /root/fstype

```plain
blkid /dev/vda1 > /root/fstype
```{{exec}}

Check the /etc/fstab to see how your system is mounting all it's partitions as it comes up.

```plain
cat /etc/fstab
```{{exec}}

But that mapping is strange, so to demystify it, use this command

```plain
ls -l /dev/disk/by-label
```{{exec}}

There are 4 ways to mount disk: label, partuuid, path, and uuid. You can verify this by looking in each of these locations. This gives you how the system is mapping to the underlying disks.

```plain
for type in $(ls /dev/disk); do echo "type is $type"; ls -l /dev/disk/$type; done
```{{exec}}

Remember to put the file that the system uses to mount the disks into /root/mountinfo

```plain
echo "/etc/fstab" > /root/mountinfo
```{{exec}}

</details>