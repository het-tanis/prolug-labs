### Lab Activities
So now that we have the roles correct, let's make a playbook that inherits those roles based on correct tags. By default if no tags are given, it will run all roles.

Create a playbook to inhert roles. Name it ` /root/playbooks/environment.yaml `

Test the playbook with and without the different tags ` install ` and ` update `.


<br>
<details>
<summary>Solution</summary>
Create the correct playbook

```plain
vi /root/playbooks/environment.yaml
```{{exec}}

Copy in this value:

```
- hosts: all
  gather_facts: true
  vars:
  tasks:

  roles:
  - update
  - install
```

Run the Playbook to see it work with no tags

This playbook may take some time as it is updating the servers. Possibly even a minute.

```plain
ansible-playbook -i /root/hosts /root/playbooks/environment.yaml
```{{exec}}

Run it with just the update tag
```plain
ansible-playbook -i /root/hosts /root/playbooks/environment.yaml --tags=update
```{{exec}}

Run it with just the install tag
```plain
ansible-playbook -i /root/hosts /root/playbooks/environment.yaml --tags=install
```{{exec}}

How did these compare? 

Did it only do the work requried in each tag? 

Why do you think the default is to just use all inherited roles?

</details>
