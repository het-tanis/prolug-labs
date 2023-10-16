### Lab Activities

This is the Enterprise Ansible Playground.
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

Run or change the playbooks as you see fit.

```plain
ansible-playbook -i hosts 01_nfs_system.yaml
```{{exec}}

This breaks the first run, but works the second. This is just a sandbox environment, but feel free to play with why that happens.

</details>