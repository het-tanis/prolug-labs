### Lab Activities

You have decided to stamp out information to servers for two reasons.

1. You want the servers to know information about themselves.

2. you want to know the state of servers when certain actions occurred.

<br>
<details>
<summary>Solution</summary>

Create a json template that has information the server should know about itself for patching.

vi patching.fact

```plain
{
  "patch_group": "group2",
  "Rebooting":   "true",
  "appserver":   "true",
  "database":    "false",
  "webserver":   "false"
}
```

Create an Ansible Playbook to push that file over to the server in the correct location.

vi facts_push.yaml

```plain
- name: Patching Facts Push
  hosts: servers
  vars:
  gather_facts: True
  become: True
  tasks:

  - name: Create the facts directory in case it isn't there
    file:
      path: /etc/ansible/facts.d
      state: directory

  - name: Push over the patching.fact
    copy:
      src: /root/patching.fact
      dest: "/etc/ansible/facts.d/patching.fact"
```

Run this to see the file push to servers

```plain
ansible-playbook -i /root/hosts facts_push.yaml
```{{exec}}

Did this successfully run on the server?

Can you output the variables that the servers now know about themselves in an ansible play?

```plain
ansible servers -i /root/hosts -m setup -a "filter=ansible_local"
```{{exec}}

Do you see that the servers now know infomation about themselves? You have stamped that information in their /etc/ansible/facts.d/<anything>.fact files

Now we need to stamp information into the server about the state of the server when something occurred.

Make a jinja2 file that will be stamped to the server at a certain time.

vi stamp.j2

```plain
This is an auto generated file by ansible at {{ ansible_date_time.date }} {{ ansible_date_time.time }}.

Hostname: {{ ansible_nodename }}
System: {{ ansible_os_family }}
Proc: {{ ansible_processor_count }}
Patching Report:
  Set to reboot: {{ ansible_local.patching.Rebooting }}
  Patch Group: {{ ansible_local.patching.patch_group }}
```

Now we have to create the push over to stamp this on machines as a playbook is executed on them.

vi stamp.yaml

```plain
- name: Jinja Template Stamp
  hosts: servers
  vars:
  gather_facts: True
  become: False
  tasks:

    - name: Copy template over to all hosts
      template:
        src: /root/stamp.j2
        dest: "/root/stamp.{{ansible_date_time.iso8601_basic_short}}.txt"
```

Execute this playbook

```plain
ansible-playbook -i /root/hosts stamp.yaml
```{{exec}}

Check that the stamped file is correctly rendered.

```plain
ls -l /root/stamp*.txt
cat /root/stamp*.txt
```{{exec}}

What values were placed in the file? What happens if you deploy that template a few times? Does it overwrite, or always write to a new file? Why might you want this behavior?

</details>