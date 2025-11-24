### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your deployment teams have been looking for ways to deploy different environments. You know that your Ansible playbooks are static and need to be reused for different environments. You decide to research the use of variables in Ansible.

Examine variable use in Ansible.

Use setup to see collected variables about target servers in an environment.

Load variables from different sources into your playbook.

<br>
<details>
<summary>Solution</summary>

Create a playbook that shows a username and password

vi user.yaml

```plain
- hosts: localhost
  gather_facts: true
  vars:
  tasks:
   
  - name: Debug username and password
    debug:
      msg: "This is user {{username}} and their password is {{password}}."
```

Execute this playbook to see it run.

```plain
ansible-playbook user.yaml
```{{exec}}

If this broke, why did it break? 

Add the username and password as extra vars at the commandline.

```plain
ansible-playbook user.yaml --extra-vars "username=scott password=secure"
```{{exec}}

Create an environment file named info.yaml and add the variables there.

vi info.yaml

```plain
username: scott
password: secure
```

Modify your user.yaml to read variables from that file.

```plain
- hosts: localhost
  gather_facts: true
  vars:
  vars_files:
  - info.yaml
  tasks:
   
  - name: Debug username and password
    debug:
      msg: "This is user {{username}} and their password is {{password}}."
```

Run the playbook to see the file read and give the variables

```plain
ansible-playbook user.yaml
```{{exec}}

Did the variables you expect come out, having been read from info.yaml?

Read about variable precedence here: [Variable_Precedence](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#understanding-variable-precedence)

What do you expect the outcome to be, if you execute this?

```plain
ansible-playbook user.yaml --extra-vars "username=notscott password=notsecure"
```{{exec}}

What was printed out? Is this in line with what you expected from variable precedence?

Switching gears a little here, let's look at the variables Ansible can read about servers with gather facts.

```plain
ansible servers -i /root/hosts -m setup
```{{exec}}

What does Ansible know about the different servers?

Filter down to just distribution information

```plain
ansible servers -i /root/hosts -m setup -a "filter=ansible_distribution*"
```{{exec}}

What does Ansible know about the version of the server? Can you find the kernel information?

```plain
ansible servers -i /root/hosts -m setup -a "filter=ansible_kernel*"
```{{exec}}

What information about the kernel is shown? Are the two systems that you're using in this lab the same? Why or why not?

</details>
