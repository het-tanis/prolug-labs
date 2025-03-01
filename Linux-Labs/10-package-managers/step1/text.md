You are a new system administrator at a company. You need to better understand the software that is installed on the system. You also need to better understand how to install software and where that software is coming from.

You decide to start by looking at a server to see what software package information you can discover.
<br>

### Solution
<details>
<summary>Solution</summary>
List all the packages on the system.

```plain
dpkg -l
```{{exec}}

Use 'q' to exit. How many packages do you have?

If you do not want to count them all, use something like this.

```plain
dpkg -l | wc -l
```{{exec}}

Approximately how many packages do you have?

Can you find all the packages that have something to do with ssl?

```plain
dpkg -l | grep -i ssl
```{{exec}}

How many packages have SSL in their name or description?

Suppose you want to know what package installed a certain command. Use dpkg -S to find where a command was installed from.

```plain
dpkg -S iostat
```{{exec}}

What package provided the iostat command on this server?

What if you knew that sysstat provided iostat, but you also wanted to know everything else that is provided by sysstat?

```plain
dpkg -L sysstat
```{{exec}}

Can you confirm that pidstat is a commmand that was installed with sysstat?

```plain
dpkg -L sysstat | grep -i pidstat
```{{exec}}

Read the man pages for more useful information that can be gathered by dpkg.

```plain
man dpkg
```{{exec}}

Can you find, near the bottom, what the default log for dpkg is?

use "q" to exit.

Read or query through the dpkg log. Can you tell when the sysstat package was installed?

```plain
grep -i sysstat /var/log/dpkg.log
```{{exec}}

When did the system install sysstat?

</details>