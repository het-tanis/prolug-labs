Let's look at what system ports are open and what software is running on each of them. You will need to determine in your future build whether or not all these ports are needed. This is just checking what currently is in set on the systems.

<br>

### Solution
<details>
<summary>Solution</summary>
List all the open ports on the system for evaluation.

```plain
ss -ntulp
ss -ntulp | grep -i udp | wc -l
ss -ntulp | grep -i tcp | wc -l
```{{exec}}

If you take a quick look at these, do you know what they all are doing?

Check out the systemd-resolve process

```plain
lsof -i :53
```{{exec}}

See if you can find how it was started?

```plain
systemctl | grep -i resolv
systemctl cat systemd-resolved
```{{exec}}

You can continue this for all the processes, to see what is currently running on one of your systems. This will be useful for you to enumerate so you can verify that you have the same basic functionality on the new servers that you are building.


</details>