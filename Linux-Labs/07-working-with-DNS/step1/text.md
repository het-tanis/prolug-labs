Your team is going to be doing some DNS work and you have to figure out how to use the tools in your Linux system.

Use host, dig, nslookup and figure out what type of information they show you.

Check the contents of /etc/resolv.conf.

Do a traceroute to 8.8.8.8 and 1.1.1.1.

<br>

### Solution
<details>
<summary>Solution</summary>
Use the host command to www.google.com

```plain
host www.google.com
```{{exec}}

What information are you seeing? How many IP addresses are there? How many are IPv4 and IPv6?

Use the dig command against www.google.com. 

```plain
dig www.google.com
```{{exec}}

How many A records do you see? What server was used for the DNS query?

This prompts you to wonder where your system gets it's configuration for DNS. Check the /etc/resolv.conf to see if you can find where your system is looking at DNS.

```plain
cat /etc/resolv.conf
```{{exec}}

What nameservers does your system try to use? Enter these into /root/nameservers

```plain
cat /etc/resolv.conf | grep nameserver > /root/nameservers
```{{exec}}

Traceroute is installed on the system. Use traceroute to see if you can map the hops from you to www.google.com

```plain
traceroute www.google.com
```{{exec}}

What output do you see? Are all of the addresses shown? Why do you think that is? What's the highest latency you see between hops?


</details>