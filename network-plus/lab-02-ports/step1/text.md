List TCP and UDP sockets with the owning process on this server.

```plain
ss -tulpn > /root/ports/listeners.txt
cat /root/ports/listeners.txt
```{{exec}}

`-t` TCP, `-u` UDP, `-l` listening, `-p` process, `-n` numeric. A port without
a process is usually a permissions problem, not a network one.

Can you search for just ssh?

```plain
ss -tulpn | grep -i ssh
```{{exec}}

Did this filter down to just ssh?

What is the purpose of the -i in this command?

Can you filter for just a port number?

```plain
lsof -i :22
```{{exec}}

What information did this show you?

Can you use lsof with -p to look at the process associated with ssh in the lab?

```plain
lsof -p <pid from earlier commands>
```