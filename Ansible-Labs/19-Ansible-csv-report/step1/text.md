Management has requested that you provide system information about all of the systems in your HPC cluster and give it to them in a format they can digest via Excel. You have decided to build an Ansible playbook that can report out in .csv format and make them happy.

### Lab Activities
Verify your /root/hosts file exists.

Create a directory called ` /root/playbooks/roles `

Create one galaxy inside of /root/playbooks/roles called ` data_gather `.

Update the data_gather roles to properly do it's function, which can be referenced from /answers/ files.


<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

make the directory structure as required.

```plain
mkdir -p /root/playbooks/roles
mkdir -p /root/playbooks/reports
cd /root/playbooks/roles
```{{exec}}

Note: You're now moved into that directory and can create the required role using ansible-galaxy command

```plain
ls -l
tree
ansible-galaxy init data_gather
```{{exec}}

and check

```plain
ls -l
tree
```{{exec}}

Copy the data_gather.yaml from /answers into data_gather.yaml so that it executes correctly.

```plain
cp /answers/data_gather.yaml /root/playbooks/data_gather.yaml
```{{exec}}

Now that you've done that examine the playbook to see what is going to happen and how the roles are inherited.

```plain
cat /root/playbooks/data_gather.yaml
```{{exec}}

Copy the main.yml from /answers into main.yml so that it executes correctly.

```plain
cp /answers/main.yml /root/playbooks/roles/data_gather/tasks/main.yml
```{{exec}}

Now that you've done that examine the playbook to see what is going to happen.

```plain
cat /root/playbooks/roles/data_gather/tasks/main.yml
```{{exec}}

Why do we have to run two different shell commands?

What is the iso8601_basic_short value going to do when ansible_date_time is called?

Copy the Jinja2 template from /answers into data_gather.j2 so that it can be reported out.

```plain
cp /answers/data_gather.j2 /root/playbooks/roles/data_gather/templates/data_gather.j2
```{{exec}}

Now that you've done that examine the Jinja2 to see what is going to be reported out

```plain
cat /root/playbooks/roles/data_gather/templates/data_gather.j2
```{{exec}}

You are now ready to move on to the next part of the lab

</details>