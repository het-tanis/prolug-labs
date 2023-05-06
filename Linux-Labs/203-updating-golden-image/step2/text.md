You've checked the curent state of the system. Now it's time to upgrade everything. 

Upgrade your system.

See what packages were upgraded.

Verify that your system needs to restart and see if there is a newer kernel than what is running.

<br>

### Solution
<details>
<summary>Solution</summary>
Upgrade your system

```plain
time apt upgrade -y
```{{exec}}

Approximately how long did it take for your system to upgrade?

Check the apt log to see the packages that were upgraded on your system today.

```plain
cat /var/log/apt/history.log
```{{exec}}

Why are some items installed, and others only upgraded? This may require you to go on an internet safari to find a good answer.

Check if the system wants to boot to a new kernel or not

```plain
needrestart -k
```{{exec}}

So the kernel that we're currently running is not the most current (newly installed) kernel that exists on the system. How can we also verify that?

```plain
uname -r   #shows the current kernel
ls /boot   #shows the installed kernels
grep vmlinuz /boot/grub/grub.cfg
```{{exec}}

So you need to think about why the grub.cfg menu has the new version and old (current) version of the kernel in there. This is because we always install a kernel and can fall back in the unlikely condition of a crash when the new kernel comes up.

</details>