### Lab Activities
Verify your hosts file and create a deploy playbook called /root/deploy.yml to push the tar.gz file /root/deploy.tar.gz over to all servers in /opt


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