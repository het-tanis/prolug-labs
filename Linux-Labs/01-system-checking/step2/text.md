Now let's dig a little deeper

Do each command and think about what output you're looking at. You may run them multiple times, if needed and to compare the output.

<br>

### Solution
<details>
<summary>Solution</summary>
Let's look at the virtual memory usage of this system.

```plain
vmstat 1 5
```{{exec}}

What are you seeing here? Is this system under high memory usage or not?

Next we check the overall CPU usage of the system every second for 5 seconds.

```plain
mpstat 1 5
```{{exec}}

Is this system under high CPU load or not?

Next we check what processes are running on the system

```plain
ps -ef
ps -ef | awk '{print $1}' | sort | uniq -c
```{{exec}}

What users is using the most processes? Do you think this system is doing any real work or just sitting there running an OS?

Next we check what processes are executing on the processor every second.

```plain
pidstat 1 5
```{{exec}}

Why do these have different length output? What processes were using the most CPU? Which showed up the most often?

Next we may want to see more CPU and Disk usage on the system in 1 second increments. Do you think you could modify this to run for 30 seconds?

```plain
iostat -xz 1 5
```{{exec}}

</details>