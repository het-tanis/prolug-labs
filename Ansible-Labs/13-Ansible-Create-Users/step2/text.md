### Lab Activities
Verify your /root/user_key_add.yaml file. You may note that the hosts file has variables set that we will be using to push the correct files in our first playbook. 

Modify and generate keys for the users.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/user_key_add.yaml
```{{exec}}

Note: This will generate keys for the existing users.

Run the Playbook push the users.
```plain
ansible-playbook -i /root/hosts /root/user_key_add.yaml
```{{exec}}

Run an ad hoc command to verify keys were added to the users.

```plain
ansible servers -i /root/hosts -m shell -a "ls /home/*engineer/.ssh"
```{{exec}}

</details>