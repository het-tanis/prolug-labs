So far you've enabled UFW and verified that you could see the open ports that are allowed to be connected to on your host.

Setup a web server (apache2) on node01.

Verify from controlplane that you cannot connect on port 80 to node01.

Allow apache2 (port 80) to be exposed through the UFW.

Verify from controlplane that you can now connect on port 80 to node01.

<br>

### Solution
<details>
<summary>Solution</summary>
Install the apache2 web server and verify it is running.

```plain
apt -y install apache2
```{{exec}}

```plain
ss -ntulp | grep -i apache2
lsof -i :80
```{{exec}}

Exit back to controlplane and verify that you cannot connect to apache on node01

```plain
exit
```{{exec}}

```plain
timeout 5 curl node01:80
```{{exec}}

Why do you think you were unable to connect?

Connect back to node01 and check your list of apps in UFW

```plain
ssh node01
```{{exec}}

```plain
ufw app list 
```{{exec}}

Is this different than what you saw before? Why do you think that is?

Check for any differences between the apps that were added.

```plain
ufw app info Apache
ufw app info "Apache Full"
ufw app info "Apache Secure"
```{{exec}}

What differences do you see in these? Why might it matter?

Allow apache to be exposed through the firewall

```plain
ufw allow Apache
```{{exec}}

Exit back to controlplane and verify that you can connect to apache on node01

```plain
exit
```{{exec}}

```plain
curl node01:80
timeout 3 curl node01 | grep "Apache2 Ubuntu Default Page"
```{{exec}}

What did you see when it connected?

Was it the default apache web page?

</details>