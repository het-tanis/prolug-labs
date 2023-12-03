### Lab Activities

Your team has decided to stamp variables to your servers so that they know information about themselves relative to their job functions.

Verify your /root/hosts file, /root/custom_fact_push.yaml, and /root/group_by.yaml files. You may note that the hosts file has variables set that we will be using to push the correct files in our first playbook. In our second playbook we will be grouping by those facts so that the playbook can dynamically pull facts and group by those facts that servers "know" about themselves in the environment.

Push the custom fact to all servers using custom_fact_push.yaml file

Verify that custom facts have been set by grouping servers together and checking the host groups that are dynamically pulled from servers based on those facts.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Note: There are variables now assigned to each of the servers (env)

```plain
cat /root/custom_fact_push.yaml
```{{exec}}

Note: this will make the directory to push the patching.fact file into. The files start out named differently, but are the same when placed on the servers

```plain
cat /root/group_by.yaml
```{{exec}}

Note: This playbook shows you the groups that the playbook starts with, pulls information from each server's custom facts, and then shows the playbooks that Ansible can use at the end.

Run the Playbook push the custom facts
```plain
ansible-playbook -i /root/hosts /root/custom_fact_push.yaml
```{{exec}}

Run the playbook to verify groupings by custom facts.
```plain
ansible-playbook -i /root/hosts /root/group_by.yaml
```{{exec}}


</details>