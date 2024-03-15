You are a new system administrator at a company. You've been tasked with the process of building out new servers. You would like to gather information about the current systems to see how they started up and what is currently running on them. You find yourself at a command prompt and need to find out how the system started, what processes are running and how they were started, and what ports are exposed.

What kernel version and startup parameters were used to start this system?

What hardware does your system currently run on? Processor, NIC, Virtualization?

Use the Solution if you do not know the correct answers.

<br>

### Solution
<details>
<summary>Solution</summary>
First we check what version of Linux we're on and kernel

```plain
cat /etc/*release
uname -r
```{{exec}}

We may want to know how the system was called by it's bootloader (Grub)

```plain
cat /proc/cmdline
```{{exec}}

Alternatively we may want to look at the startup inside of dmesg.

```plain
dmesg | head -15
```{{exec}}

Now we may want to check if the system is virtualized, what hardware it has for the NIC and also loaded kernel modules around the networking.

```plain
virt-what
```{{exec}}

Are you on a virtualized system? How can you tell?

What do these commands show?

```plain
dmidecode | grep -iE "virt|prod"
```{{exec}}

What do you see when you just use dmidecode? 

Anything interesting?

What might you capture from these commands that will help you in building out a new Linux system?

</details>