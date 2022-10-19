Verify your hosts file and test ad hoc commands to your servers

Verify server uptime

Verify OS type of server

Verify date and time of servers

Write the version of servers into a file called /root/version

Write the current date from the servers into a file called /root/date

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Checks server uptime
```plain
ansible servers -i /root/hosts -m shell -a 'uptime'
```{{exec}}

Setup module gives so much information you can use during playbook execution.
```plain
ansible servers -i /root/hosts -m setup
```{{exec}}

Cut that output down a bit so you can just check the host information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_distribution'
```{{exec}}

Send this output to the required file
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_distribution' > /root/version
```{{exec}}

Cut that output down a bit so you can just check the host information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_date_time'
```{{exec}}

Send this output to the required file

Cut that output down a bit so you can just check the host information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_date_time' > /root/date
```{{exec}}

</details>