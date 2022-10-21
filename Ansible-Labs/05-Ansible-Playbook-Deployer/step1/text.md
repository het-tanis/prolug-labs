### Lab Activities
Verify your hosts file and create a deployer to push the tar.gz file /root/deploy.tar.gz over to all servers in /opt


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
        checksum: <add in checksum from earlier>
```

Copy over your /root/configfile.cfg to that directory
```plain
ansible servers -i /root/hosts -m copy -a 'src=/root/configfile.cfg dest=/opt/deployment'
```{{exec}}

Let's fix a bad configuration line from 000000 to 111111 with the lineinfile module
```plain
ansible servers -i /root/hosts -m lineinfile -a "path=/opt/deployment/configfile.cfg regexp='^var1' line='var1=111111'"
```{{exec}}

Quick verification that it looks good on all servers
```plain
ansible servers -i /root/hosts -m shell -a 'cat /opt/deployment/configfile.cfg'
```{{exec}}

</details>