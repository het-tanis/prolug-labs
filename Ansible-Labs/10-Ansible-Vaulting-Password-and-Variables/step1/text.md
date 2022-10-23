### Lab Activities
Verify your /root/hosts file and /root/variables.yaml file


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