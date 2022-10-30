Now let's dig a little deeper into networking

Do each command and think about what output you're looking at. You may run them multiple times, if needed and to compare the output.

<br>

### Solution
<details>
<summary>Solution</summary>
Let's look at the network usage and load of the system.

```plain
sar -n DEV 1 5
```{{exec}}

What are you seeing here? What devices are showing up? Do any devices seem to be under high load? Which one has the most traffic?

Next we check tcp packets and errors. 

```plain
sar -n TCP,ETCP 1 5
```{{exec}}

Do we appear to be seeing any large numbers of errors? Why might retransmits be a big problem?

</details>