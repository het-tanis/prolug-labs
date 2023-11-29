You are a new system administrator at a company. You've decided that you need to start using loops to increase your productivity and monitoring of the system.

Create a conditional loop to watch cpu resources every 5 seconds.

Create a conditional loop to count to 10, with various different starting and ending numbers.

<br>

### Solution
<details>
<summary>Solution</summary>
Create a while loop to conditionally check cpu resources every 5 seconds until you break it.

```plain
while true; do uptime; sleep 5; done
```{{exec}}

You can stop this execution with a "ctrl + c" and that will stop it.

Let's make a conditional loop where we control the condition by incrementing a number.

Set count to 0

```plain
count=0
```{{exec}}

Set conditon = 10

```plain
condition=10
```{{exec}}

Create a loop that increments over count while the expression evaluates true.

```plain
while [[ $count -lt $condition ]]; do echo "I am counting on $count"; (( count++ )); done
```{{exec}}

What happened with this count? Did it count the way you expected? How can you modify it to count the way you expected?

What are some things you notice about using a conditional loop? I want you to think about them as we move over into counting loops so you can contrast how they work.

</details>