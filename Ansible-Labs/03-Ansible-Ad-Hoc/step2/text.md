Verify with ping module that access to all hosts is achieved


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