### Lab Activities
Your team has decided they need to more securely keep their secret information, instead of just passing values at the command line. You know that Ansible Vault can be used to securely store variables.

Verify your /root/hosts file and /root/variables.yaml file

Verify the functionality of the /root/variables.yaml file by executing and giving extra-vars as needed.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

```plain
cat /root/variables.yaml
```{{exec}}

Run the Playbook to see the output (This should break)
```plain
ansible-playbook variables.yaml
```{{exec}}

Run the Playbook again and give the correct variables to see it exectue correctly
```plain
ansible-playbook variables.yaml --extra-vars "username=scott password=secure"
```{{exec}}


</details>