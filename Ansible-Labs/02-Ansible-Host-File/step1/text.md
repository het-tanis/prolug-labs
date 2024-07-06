Your team has decided they need a tool they can use to control and operate the many servers you have in your environment. You have been tasked with evaluating Ansible.

You know that inventory is one of the most important parts of system administration. So you want to get it right. Setup and complete the different inventory challenges in this lab.

Create an Ansible file called /root/hosts with the hosts in your network.

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
