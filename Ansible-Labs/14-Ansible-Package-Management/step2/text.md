### Lab Activities
Verify your /root/packages_install.yaml file. You may note that the hosts file has variables set that we will be using to install packages on the right servers. 

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/packages_install.yaml
```{{exec}}

Note: This will conditionally install certain packages on hosts. 

Run the Playbook push the users.
```plain
ansible-playbook -i /root/hosts /root/packages_install.yaml
```{{exec}}

Run it again to see that nothing has to change. This demonstrates [idempotency](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-Idempotency), where the result of the previous run is the same in subsequent runs. 

</details>
