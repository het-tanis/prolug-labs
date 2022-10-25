Verify connectivity to all hosts with ping module and save the output to /root/ping_check.


<br>
<details>
<summary>Solution</summary>

Check ansible-doc help
```plain
ansible servers -i /root/hosts -m ping
```{{exec}}

Check ansible-doc help
```plain
ansible servers -i /root/hosts -m ping > /root/ping_check
```{{exec}}

</details>
