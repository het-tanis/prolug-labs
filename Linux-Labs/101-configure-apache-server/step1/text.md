Your team has determined they need a website to test deployments rapidly. You have been tasked with installing a web server on node01.

Deploy an apache2 webserver on node01.

Capture the version and installed apache2 packages for your records.

Verify that node01 is listening on port 80.

Verify that the web page is working.

<br>

### Solution
<details>
<summary>Solution</summary>
Connect to node01

```plain
ssh node01
```{{exec}}

Verify there is no apache2 package

```plain
dpkg -l | grep -i apache2
systemctl | grep -i apache2
```{{exec}}

Deploy the apache2 webserver package

```plain
apt -y install apache2
```{{exec}}

Verfiy the version of software

```plain
dpkg -l | grep -i apache2
```{{exec}}

Verify that the server is running, set to run on reboot, and it working on the default ports.

```plain
systemctl status apache2.service --no-pager
lsof -i :80
ss -ntulp | grep :80
```{{exec}}

What are the names of the users that kicked off this process? Why might it be important to note this?

Further verify that the firewall isn't running to complicate things

```plain
ufw status
```{{exec}}

Should see this disabled.

Let's go back to controlplane 

```plain
exit
```{{exec}}

Make sure you can see the default webpage

```plain
curl node01:80
```{{exec}}
 
Did you see the default webpage? Ok, you've set up the first part, let's see what else out team has for us in the next part.

</details>