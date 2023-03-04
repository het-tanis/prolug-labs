Your team has determined they need to run an antivirus program on your servers. This satisfies the PCI-DSS requirement that your security team has identified.

Install ClamAV

<br>

### Solution
<details>
<summary>Solution</summary>

Update your apt repository.

```plain
apt-get update -y
```{{exec}}

Install ClamAV.

```plain
apt-get install clamav clamav-daemon -y
```{{exec}}

Verify that you have the binaries on your system.

```plain
which clamscan
which freshclam
```{{exec}}

Now that you've installed ClamAV, let's move on and go to the next part of the lab.

</details>