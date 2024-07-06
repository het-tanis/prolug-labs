You have been using Ansible and have decided to work with the templating tool that comes with it. You are going to use Jinja2 to stamp when activities and deployments happen on your servers.

Your team wants to also verify that certain conditions exist when the deployments occur. You figure out how to use Jinja2 for that task.

### Lab Activities
Verify your hosts file 

Create a Jinja2 template file called /root/template.j2 to stamp values on each of the hosts as you execute the playbook.

Create a deploy playbook called /root/template.yml to push the template /root/template.j2 over to all servers as the file /root/template.txt. Verify the file is populated with values as expected.
<br>

<details>
<summary>Tip</summary>
If you get stuck, the answer file is found in /answers/template.yml

```plain
cp /answers/template.yml /root/template.yml
cp /answers/template.j2 /root/template.j2
```{{exec}}
</details>

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

### Yaml for playbook
```
---
- name: Start of Jinja2 Template Push
  hosts: servers
  vars:
  gather_facts: True
  become: False
  tasks:

    - name: Copy template over to all hosts
      template:
        src: /root/template.j2
        dest: "/root/template.txt"

```

Run Playbook and verify that everything pushed correctly

```plain
ansible-playbook -i /root/hosts /root/template.yml
```{{exec}}

Manual verify for all 

```
ansible servers -i /root/hosts -m shell -a 'cat /root/template.txt'
```{{exec}}

</details>