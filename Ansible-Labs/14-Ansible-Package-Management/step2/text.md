### Lab Activities
Verify your /root/packages_install.yaml file. You may note that the hosts file has variables set that we will be using to install packages on the right servers. 

Modify and generate keys for the users.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/packages_install.yaml
```{{exec}}

Note: This will generate keys for the existing users.

Run the Playbook push the users.
```plain
ansible-playbook -i /root/hosts /root/packages_install.yaml
```{{exec}}

Run it again to see that nothing has to change.

</details>