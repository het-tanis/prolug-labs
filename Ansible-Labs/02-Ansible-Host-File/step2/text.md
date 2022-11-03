Verify connectivity to all hosts with ping module and save the output to /root/ping_check.


<br>
<details>
<summary>Solution</summary>

Executing ping module against both servers
```plain
ansible servers -i /root/hosts -m ping
```{{exec}}

Executing ping module against both servers and output to /root/ping_check
```plain
ansible servers -i /root/hosts -m ping > /root/ping_check
```{{exec}}

</details>
