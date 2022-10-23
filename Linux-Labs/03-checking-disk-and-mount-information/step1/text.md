Check physical disk information.

Echo the number of physical disks you have into /root/disks

Echo the number of partitions of that disk into /root/partitions

<br>

### Solution
<details>
<summary>Solution</summary>
Check disk information and count partitions

```plain
fdisk -l | grep -i vd
```{{exec}}

Why did we use VD?

Let's use another commad to see that information another way.
```plain
lsblk
```{{exec}}

and

```plain
blkid
```{{exec}}

And, if you need the answer:

```plain
echo 1 > /root/disks
echo 3 > /root/partitions
```{{exec}}

</details>