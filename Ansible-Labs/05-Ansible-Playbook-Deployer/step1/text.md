### Lab Activities
Verify your hosts file 

Create a deploy playbook called /root/deploy.yml to push the file /root/deploy.tar.gz over to all servers in the /opt directory.
<br>

<details>
<summary>Tip</summary>
If you get stuck, the answer file is found in /answers/deploy.yml

```plain
cp /answers/deploy.yml /root/deploy.yml
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
- name: Start of Deployer playbook
  hosts: servers
  vars:
  gather_facts: True
  become: False
  tasks:

    - name: Copy deploy.tar.gz over at {{ ansible_date_time.iso8601_basic_short }}
      copy:
        src: /root/deploy.tar.gz
        dest: /opt/deploy.tar.gz
        checksum: c6cd21b75a4b300b9228498c78afc6e7a831839e
```

Run Playbook and verify that everything pushed correctly

```plain
ansible-playbook -i /root/hosts /root/deploy.yml
```{{exec}}

</details>