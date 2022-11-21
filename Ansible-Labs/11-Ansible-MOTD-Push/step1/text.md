### Lab Activities
Verify your /root/hosts file and /root/motd_push.yaml file

Push the motd messages to all servers based on the new variables assigned in the /root/hosts file.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Note: There are variables now assigned to each of the servers (env)

```plain
cat /root/motd_push.yaml
```{{exec}}

Run the Playbook push the MOTD
```plain
ansible-playbook -i /root/hosts motd_push.yaml
```{{exec}}

Run an adhoc command to check all the MOTD on all servers
```plain
ansible servers -i /root/hosts -m shell -a 'cat /etc/motd'
```{{exec}}

Manually check by logging into node01
```plain
ssh node01 'cat /etc/motd'
```{{exec}}

</details>