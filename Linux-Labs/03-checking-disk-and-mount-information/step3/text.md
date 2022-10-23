Check disk size and usage

Find the size of the partition root (/) and put it in a file called /root/size.

Place a single file that is 3G at location /root/bigfile.

Place 10,000 files called file{1..10000} in /root directory

<br>

### Solution
<details>
<summary>Solution</summary>
Check the overall current disk space

```plain
df -h
```{{exec}}

Write out the size of just root (/) to /root/size

```plain
df -h / | grep -v Size | awk '{print $2}' > /root/size
```{{exec}}

This command just cuts out the unnecessary information. You can check it's output by removing > /root/size, if you like.

Let's make a giant file filled with 0's and then check available space.
```plain
dd if=/dev/zero of=/root/bigfile bs=1024k count=3000
```{{exec}}

Re-Check size to see that the filesystem is much more full now.

```plain
df -h /
ls -lh /root/bigfile
```{{exec}}

Let's write out 10,000 files and see how that affects our inode usage

```plain
df -i /
touch /root/file{1..10000}
ls /root | wc -l
df -i /
```{{exec}}


</details>