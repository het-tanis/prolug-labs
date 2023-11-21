You are a new system administrator at a company. You've been tasked with finding out information about a set of servers that has very little to no documentation on it.

Check network information.

Put the name of your network interface into a file called /root/interface.

Put the ip address of your network interface into a file called /root/primary-ip.

Write the default route out to a file called /root/default.

<br>

### Solution
<details>
<summary>Solution</summary>
Check your ip address

```plain
ip addr 
```{{exec}}

What is the name of your interface? 

```plain
ip addr | grep enp | grep mtu | awk '{print $2}' | sed 's/://'
```{{exec}}

Put that value in a file /root/interface.

```plain
ip addr | grep enp | grep mtu | awk '{print $2}' | sed 's/://' > /root/interface
```{{exec}}

There are other ways to do this, but this will do it with one command.

What is the ip of your interface? 

```plain
ip addr | grep enp | grep inet | awk '{print $2}' 
```{{exec}}

Put that value in a file /root/primary-ip.

```plain
ip addr | grep enp | grep inet | awk '{print $2}' > /root/primary-ip
```{{exec}}

Let's pull the default route for your system
```plain
ip route
```{{exec}}

What is the default route for your system? Write this out to /root/default

```plain
ip route | grep -i default | awk '{print $3}' > /root/default
```{{exec}}

Ping the default gateway 3 times and verify that you get a response back

```plain
ping -c3 `ip route | grep -i default | awk '{print $3}'`
```{{exec}}

</details>