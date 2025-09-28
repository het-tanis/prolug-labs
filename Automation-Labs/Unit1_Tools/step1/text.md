### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/pcae/unitindex.html

You have found yourself in a bash shell. Ensure that you can execute simple commands and interact with your environment.

Verify version of bash

Verify shell PID

Loop over a list of servers with ssh

<br>
<details>
<summary>Solution</summary>

Verify your location and version of bash

```plain
which bash
```{{exec}}

```plain
/usr/bin/bash --version
```{{exec}}

Verify your shell PID

```plain
echo $$
```{{exec}}

Verfiy your SHELL variable

```plain
echo $SHELL
```{{exec}}

Loop over your target servers

```plain
for server in controlplane node01; do timeout 10 ssh $server 'hostname; uptime'; done
```{{exec}}


</details>