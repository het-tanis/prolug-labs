Your team has decided they need a tool they can use to control and operate the many servers you have in your environment. You have been tasked with evaluating Ansible.

You are adding to your original deploy file and now want to execute the installer on all systems. Make sure that the playbook runs to completion and sets the environment as you need it.

### Lab Activities
Verify your hosts file 

Create a deploy playbook called /root/deploy.yml to push the file /root/deploy.tar.gz over to the /opt directory on all servers, unpackage it, and run the installer.sh.
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

Everything above is from previous lab

This creates a directory /opt/app on every server
```
    - name: Create directory for us to untar into
      file:
        path: /opt/myapp
        state: directory
```

This module unarchives and places the contents in /opt/myapp
```
    - name: Untar the deployer
      unarchive:
        src: /opt/deploy.tar.gz
        dest: /opt/myapp
```

```
    - name: Make the installer script executable
      file:
        path: /opt/myapp/deploy/deployer.sh
        mode: '0755'
```

These last two modules execute the script to install the app and show us the debug output so we can test/review.
```
    - name: Run the installer and register the output
      shell: /opt/myapp/deploy/deployer.sh
      register: installer_output

    - name: Debug and show the variable installer_output
      debug:
        var: installer_output
```

Run Playbook and verify that everything pushed correctly

```plain
ansible-playbook -i /root/hosts /root/deploy.yml
```{{exec}}

Manual verify for all 

```
ansible servers -i /root/hosts -m shell -a 'ls -l /opt/myapp'
```{{exec}}

</details>
