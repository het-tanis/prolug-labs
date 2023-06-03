Your team has been using Ansible and decided that they need to have better reusability and modularity to their code. You have been tasked with testing and deploying galaxy to see how inherited roles work in Ansible.

### Lab Activities
Verify your /root/hosts file exists.

Create a directory called ` /root/playbooks/roles `

Create two galaxies inside of /root/playbooks/roles called ` update ` and ` install `.

Update the update and install roles to properly do their functions, which can be referenced from /root/packages_*.yaml files.


<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Note: There are variables now assigned to each of the servers (env)

make the directory structure as required.

```plain
mkdir -p /root/playbooks/roles
cd /root/playbooks/roles
```{{exec}}

Note: You're now moved into that directory and can create the required roles using ansible-galaxy command

```plain
ls -l
tree
ansible-galaxy init update
```{{exec}}

and check

```plain
ls -l
tree
```{{exec}}

Now create the second role

```plain
ls -l
ansible-galaxy init install
```{{exec}}

and check again

```plain
ls -l
tree
```{{exec}}

Go into the update directory to update and create the right files.

```plain
vi /root/playbooks/roles/update/tasks/main.yml
```{{exec}}

```
---
# tasks file for update

- include_tasks: update.yaml
  tags:
    - update
```

You also have to create that file correctly within the tasks.

```plain
vi /root/playbooks/roles/update/tasks/update.yaml
```{{exec}}

```
- name: Upgrade all packages to the latest version
  apt:
    name: "*"
    state: latest
  tags:
    - update
```

Now you have to do that for the second directory

Go into the update directory to update and create the right files.

```plain
vi /root/playbooks/roles/install/tasks/main.yml
```{{exec}}

```
---
# tasks file for install

- include_tasks: install.yaml
  tags:
    - install
```

You also have to create that file correctly within the tasks.

```plain
vi /root/playbooks/roles/install/tasks/install.yaml
```{{exec}}

```
- name: Debug env variables just to see them
  debug:
    var: app
  tags:
    - install

- name: Install apache2 on the web server
  apt:
    pkg: 
    - apache2
    - php
    state: present
  when: '"web" in app'
  tags:
    - install

- name: Install mariadb on the web server
  apt:
    pkg: 
    - mariadb-server
    - mariadb-client
    state: present
  when: '"db" in app'
  tags:
    - install
```


</details>