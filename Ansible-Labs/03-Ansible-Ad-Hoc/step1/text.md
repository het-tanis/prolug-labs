Your team has decided they need a tool they can use to control and operate the many servers you have in your environment. You have been tasked with evaluating Ansible.

You know that individual modules can be called in ad hoc mode. So you decide to try running some commands against your test inventory of servers.

### Lab Activities
Verify your hosts file and test ad hoc commands to your servers

Verify servers uptime

Verify OS type of servers

Verify date and time of servers

### Deliverables
1. Create a file /root/version with the Ansible Facts for the distribution of each server.

2. Create a file /root/date with the Ansible Facts for the current date of each server.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Check server uptime
```plain
ansible servers -i /root/hosts -m shell -a 'uptime'
```{{exec}}

Setup module gives so much information you can use during playbook execution.
```plain
ansible servers -i /root/hosts -m setup
```{{exec}}

Cut that output down a bit so you can just check the host distribution information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_distribution'
```{{exec}}

Send this output to the required file
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_distribution' > /root/version
```{{exec}}

Cut that output down a bit so you can just check the host time information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_date_time'
```{{exec}}

Send this output to the required file

```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_date_time' > /root/date
```{{exec}}

</details>
