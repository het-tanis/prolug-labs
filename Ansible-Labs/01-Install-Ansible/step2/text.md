Check ansible-doc and see how many modules you have. Then read the documentation of modules setup and copy.

Save the number of modules you have into the file /root/modules


<br>
<details>
<summary>Solution</summary>

Check ansible-doc help
```plain
ansible-doc --help
```{{exec}}

Check all the modules and store them in a file /root/modules
```plain
ansible-doc -l | wc -l
ansible-doc -l | wc -l > /root/modules
```{{exec}}

Read the documentation on setup module (may have to hit q to exit)
```plain
ansible-doc -s setup
```{{exec}}

Read the documentation on copy module (may have to hit q to exit)
```plain
ansible-doc -s copy
```{{exec}}

</details>