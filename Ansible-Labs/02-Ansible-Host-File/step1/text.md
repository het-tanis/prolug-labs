Setup an Ansible file call /root/hosts with the hosts in your network

servers:

controlplane

node01

<br>
<details>
<summary>Solution</summary>

You may use ini or yaml format for ansible hosts files

Add this to file /root/hosts

### ini
```
[servers]
controlplane
node01
```

</details>