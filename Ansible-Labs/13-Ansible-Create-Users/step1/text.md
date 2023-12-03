### Lab Activities

Your engineering team needs to push service accounts for new users and teams to some of your systems. You have decided to do that in Ansible.

Verify your /root/hosts file, and /root/user_create.yaml files. You may note that the hosts file has variables set that we will be using to push the correct files in our first playbook. 

Push the user prod_engineer to the prod servers and the dev_engineer user to the dev servers. In the dev environment the user is allowed to be in the admin group.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Note: There are variables now assigned to each of the servers (env)

```plain
cat /root/user_create.yaml
```{{exec}}

Note: This will push users to the servers and add the group where appropriate.

Run the Playbook push the users.
```plain
ansible-playbook -i /root/hosts /root/user_create.yaml
```{{exec}}

Run an ad hoc command to verify users were added and place in groups.

```plain
ansible servers -i /root/hosts -m shell -a "tail -1 /etc/passwd; grep admin /etc/group"
```{{exec}}

</details>