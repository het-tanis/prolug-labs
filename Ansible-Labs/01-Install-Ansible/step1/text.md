Your team has decided they need a tool they can use to control and operate the many servers you have in your environment. You have been tasked with evaluating Ansible. 

Install Ansible and put the version output in a file called /root/version.


<br>
<details>
<summary>Solution</summary>

Install Ansible
```plain
apt -y install ansible
```{{exec}}

Check the version
```plain
ansible --version
```{{exec}}

Check version and send to file
```plain
ansible --version >> /root/version
```{{exec}}

</details>
