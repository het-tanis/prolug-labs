### Lab Activities

This is the Enterprise Ansible Patching lab. Set up your environment to work with the rest of the lab.
<br>
<details>
<summary>Solution</summary>

clone the git of HPC_Deploy

```plain
git clone https://github.com/het-tanis/HPC_Deploy.git
```{{exec}}

Change into that directory

```plain
cd HPC_Deploy
```{{exec}}

Run the playbook to set up the environment.

```plain
ansible-playbook -v -i /root/HPC_Deploy/hosts 03_package_update_or_install.yaml --extra-vars "action=install"
```{{exec}}

Watch this playbook run and then look at the roles that are inherited. 

What does the environment currently look like? 

Can you see the /etc/ansible/facts.d/patching.fact file on each server?

</details>