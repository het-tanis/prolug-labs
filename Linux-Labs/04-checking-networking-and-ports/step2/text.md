Check open ports on the system.

Can you find sshd and containerd listening on your system? If you can, write yes into the file /root/ports.


<br>

### Solution
<details>
<summary>Solution</summary>
Check what ports are open on your system.

```plain
ss -ntulp
```{{exec}}

```plain
ss -ntulp | grep -E "sshd|containerd"
```{{exec}}

Echo "yes" if you can see sshd and containerd listening /root/ports .

We can see them, so we'll set that to yes.
```plain
echo "yes" > /root/ports
```{{exec}}


Another way to look at the ports/processes for sshd and containerd

```plain
lsof -i :22
```{{exec}}

Connect to port 22. #Timeout just causes it to drop after 3 sec
```plain
timeout 3 nc 127.0.0.1 22
```{{exec}}

So let's stop containerd and verify that the process is no longer running.

```plain
systemctl status containerd
```{{exec}}

You may have to hit "q" to escape.

and we'll stop it.

```plain
systemctl stop containerd
```{{exec}}

Verify that you no longer see containerd running or the port open on the system.

```plain
ss -ntulp | grep containerd
```{{exec}}

</details>