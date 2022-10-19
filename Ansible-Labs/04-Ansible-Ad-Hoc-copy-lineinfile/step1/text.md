### Lab Activities
Verify your hosts file and configfile.cfg

Create a directory on your servers for deployments

Push over your config file

Change the values of var1 to equal 111111


<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

```plain
cat /root/configfile.cfg
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

Cut that output down a bit so you can just check the host information
```plain
ansible servers -i /root/hosts -m setup -a 'filter=ansible_date_time' > /root/date
```{{exec}}

</details>