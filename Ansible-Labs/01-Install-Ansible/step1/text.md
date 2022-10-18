Install Ansible and put the version number in a file called /root/version


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