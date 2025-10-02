### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/pcae/unitindex.html

You have found yourself in a bash shell. Bash natively interacts with the Linux OS via built-in tools, and native tools.

Interact with the OS using bash and scripts provided in /root.

<br>
<details>
<summary>Solution</summary>

Check all the running processes

```plain
ps -ef
```{{exec}}

Count all the running processes.

```plain
ps -ef | wc -l
```{{exec}}

Run the u2_script1.sh and look at what it shows you.

```plain
/root/u2_script1.sh
```{{exec}}

What are you shown?

Inspect the file and see if you can modify it to show the first 15 lines.

```plain
cat /root/u2_script1.sh
```{{exec}}

Note: Modify with vi or vim. You may have to RTFM to continue.

Run the u2_script2.sh and look at what it shows you.

```plain
/root/u2_script2.sh
```{{exec}}

What are you shown?

Inspect the file and see if you can make it use a different date format. You may have to read the man pages for date command.

```plain
cat /root/u2_script2.sh
```{{exec}}

Note: Modify with vi or vim. You may have to RTFM to continue.

</details>