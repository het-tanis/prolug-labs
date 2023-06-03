You are tasked with pushing the new MOTD message onto a server. You also know that the server has a correct /etc/crontab configuration that you will want to use on other systems.

scp is always "from" "to" on the command line, so the syntax is:

scp sourcetarget destinationtarget

Push the /root/motd file over to node01 at location /etc/motd and then log in to verify that the file has been pushed.

Pull /etc/crontab from node01 to controlplane as file /tmp/node01.crontab

<br>

### Solution
<details>
<summary>Solution</summary>
Verify the file you have at /root/motd

```plain
cksum /root/motd
```{{exec}}

Copy over the /root/motd to node01:/etc/motd

```plain
scp /root/motd node01:/etc/motd
```{{exec}}

You get to see information about how long it took to push the file. 

Let's ssh over and see our MOTD

```plain
timeout 1 ssh node01
```{{exec}}

Let's verify the file is exactly the size we think it is over there

We can see them, so we'll set that to yes.
```plain
ssh node01 'cksum /etc/motd'
```{{exec}}

You should now both see the motd as you log in, as well as seeing the cksum matches what you did in step 1.

Now we have config files that we need to pull and give to the vendor. Let's pull those logs back over to this server from node01.

Verify cksum of /etc/crontab file

```plain
ssh node01 'cksum /etc/crontab'
```{{exec}}

Pull file over to /tmp/node01.crontab from node01

```plain
scp node01:/etc/crontab /tmp/node01.crontab
```{{exec}}

So now that you've pulled the file over, verify that it's exactly the same as you just saw it.

```plain
cksum /tmp/node01.crontab
```{{exec}}


</details>