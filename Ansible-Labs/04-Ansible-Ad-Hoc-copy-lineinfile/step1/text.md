### Lab Activities
Verify your /root/hosts file and /root/configfile.cfg

Create a directory on your servers for deployments named /opt/deployment

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

Create a Directory on each server named /opt/deployment
```plain
ansible servers -i /root/hosts -m file -a 'path=/opt/deployment state=directory'
```{{exec}}

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