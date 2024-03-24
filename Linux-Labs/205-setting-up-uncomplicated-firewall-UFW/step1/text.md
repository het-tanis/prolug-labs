Your team has determined they need to run a firewall on all the hosts to protect them from the inevitable compromise of your system. The goal is to have your systems only capable of exposing the ports that you have documented and agreed upon with your security team.

Check the status of the UFW.

Turn on and enable the UFW.

Verify the current state of the UFW.

<br>

### Solution
<details>
<summary>Solution</summary>
SSH over to node01 and check UFW settings.

```plain
ssh node01
```{{exec}}

Check the current status of the UFW.

```plain
ufw status
systemctl status ufw
```{{exec}}

Enable the UFW so that it can manage traffic into your server.

```plain
ufw enable
```{{exec}}

Can you verify that it is now started and enabled?

```plain
ufw status
systemctl status ufw
```{{exec}}

What is the current state of the now running firewall?

Allow SSH into the system so you can create future connections

```plain
ufw allow OpenSSH
```{{exec}}

Check that SSH is allowed into the server

```plain
ufw status 
ufw status verbose
```{{exec}}

What is the difference between those two outputs? Why might you want to use one or the other?


</details>