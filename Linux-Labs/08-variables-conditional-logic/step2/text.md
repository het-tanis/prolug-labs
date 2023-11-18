Test the decision structure of Bash.

There are 3 types of decision structures, they are:

1. Single Alternatives

2. Dual Alternative

3. Multiple Alternative

Test each of these structures with the variables you have from the previous step.


<br>

### Solution
<details>
<summary>Solution</summary>
Use the single alternative structure to output whether or not httpd and sshd are running.

```plain
if [ $httpdCheck -eq "1"  ]; then echo "httpd is not running"; fi
```{{exec}}

```plain
if [ $sshdCheck -eq "0"  ]; then echo "sshd is running"; fi
```{{exec}}

Are these output like you expect? Can you make them logically incorrect, but still work according to their syntax?

Use the dual alternative structure to force the system to output something, even if the condition is not met.

```plain
if [ $httpdCheck -eq "1"  ]; then echo "httpd is not running"; else echo "httpd is running"; fi
```{{exec}}

```plain
if [ $sshdCheck -eq "0"  ]; then echo "sshd is running"; else echo "sshd is not running"; fi
```{{exec}}

Use a multiple alternative to output multiple possibilities (>2).

```plain
case "$sshdCheck" in  0) echo "sshd is running" ;; 1) echo "sshd is not running" ;; **) echo "something is really wrong" ;; esac
```{{exec}}

Can you do this same thing for the httpdCheck? How do you have to edit it? Can you set the variable of sshdCheck to verify that the ** work as you expect?

You have done some conditional logic in Bash, let's go forward and do some more test logic in the next section.

</details>