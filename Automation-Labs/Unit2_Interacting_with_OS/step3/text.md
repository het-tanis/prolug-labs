### Lab Activities

You have decided to interact with the operating system using Ansible. Execute some playbooks to see their functionality.

<br>
<details>
<summary>Solution</summary>

Run the u2_script1.yml and look at what it shows you.

```plain
ansible-playbook /root/u2_script1.yml
```{{exec}}

What are you shown?

Inspect the file and see if you can modify it to show the first and last 15 lines.

```plain
cat /root/u2_script1.yml
```{{exec}}

Note: Modify with vi or vim. You may have to RTFM to continue.

Run the u2_script2.yml and look at what it shows you.

```plain
ansible-playbook /root/u2_script2.yml
```{{exec}}

What are you shown?

Inspect the file and see if you can make it name the file differently or populate different content.

```plain
cat /root/u2_script2.py
```{{exec}}

Note: Modify with vi or vim. You may have to RTFM to continue.

Do one final ls -l against the /root directory. What is a difference between the .sh .py and .yml files?

```plain
ls -l
```{{exec}}

</details>