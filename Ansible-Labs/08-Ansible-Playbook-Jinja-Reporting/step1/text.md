### Lab Activities
Verify your hosts file 

Create a deploy playbook called /root/template.yml to check the uptime of all servers. 

Report back unreachable servers and servers that have been up longer than a day to /root/report.txt on the server of execution.
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

    - name: Get information for uptime on all systems
      shell: uptime
      register: uptime
      
    - name: Copy template over to all hosts
      template:
        src: /root/template.j2
        dest: "/root/report.{{ansible_date_time.iso8601_basic_short}}.txt"
      run_once: yes
      delegate_to: localhost
```

Run Playbook and verify that everything pushed correctly

```plain
ansible-playbook -i /root/hosts /root/template.yml
```{{exec}}

Manual verify for all 

```
cat /root/report.*.txt
```{{exec}}

</details>