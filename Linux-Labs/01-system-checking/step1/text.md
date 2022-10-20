Follow along and look around a new Linux system for the first time

<br>

### Solution
<details>
<summary>Solution</summary>
First we check what version of Linux we're on.

```plain
cat /etc/*release
```{{exec}}

Next we check the kernel version.

```plain
uname -r
```{{exec}}

Next we might want to know how long the system has been up.

```plain
uptime
```{{exec}}

Next we might want to see how the system booted and what kernel parameters were passed when the system was started.

```plain
cat /proc/cmdline
```{{exec}}


</details>