### Lab Activities
Verify your /root/hosts file, and /root/packages_update.yaml files. You may note that the hosts file has variables set that we will be using to push the correct files in our first playbook. 

Update all the packages to the newest version

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Note: There are variables now assigned to each of the servers (env)

```plain
cat /root/packages_update.yaml
```{{exec}}

Note: This will update all current packages on the server

Run the Playbook update all the packages.
```plain
ansible-playbook -i /root/hosts /root/packages_update.yaml
```{{exec}}

Better run it twice just to compare the output.

</details>