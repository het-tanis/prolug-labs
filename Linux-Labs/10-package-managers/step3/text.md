Now that we've used dpkg and apt to manipulate packages, you decide to investigate where the software you're adding to your system comes from.

<br>

### Solution
<details>
<summary>Solution</summary>

When you did your apt update, your system checked repositories for newer packages. Find where those trusted repositories exist on your system.

```plain
cd /etc/apt
grep -v '^#' /etc/apt/sources.list.d/ubuntu.sources
```{{exec}}

Do you recognize these repositories from your update and upgrade?

You have another directory that extends the use of that list. Examine that directory to see if there are any additional configured repositories for your system currently.

```plain
ls /etc/apt/sources.list.d
```{{exec}}

As of Ubuntu 24.04 this is now the location that the default repositories for the system are defined.

You want to add a tool called Grafana to your servers. Grafana has their own repositories that are not configured on your system. So, you can configure that repository on your server.

```plain
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
```{{exec}}

This command will drop the contents of the echo into a file in your /etc/apt/sources.list.d directory. There is a gpg key that is used to sign packages and establishes a trust between your system and the software items you download from that repository.

Download and put the key in your system to establish that trust.

```plain
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
```{{exec}}

Verify that the system is using that repository.

```plain
apt update
```{{exec}}

Do you see grafana in the repository list?

Can you search for the package promtail and then verify that it comes from the grafana repository?

```plain
apt search promtail
apt show promtail
```{{exec}}

What is the homepage? What is the APT-Source? What is the description of that tool?

</details>