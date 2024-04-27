Create counting loops that count over a list of numbers, a generated list of numbers, and a file read.

1. Create a counting loop over a list of numbers or items.

2. Generate numbers programmatically and loop over them.

3. Read the contents of a file and loop over the variables.

Test each of these counting loops and see their behavior.


<br>

### Solution
<details>
<summary>Solution</summary>
Create a counting loop over a list of numbers.

```plain
for i in 1 2 3 4 5; do echo "I am counting over $i"; done
```{{exec}}

```plain
for dessert in cookie cake pie; do echo "I am counting over $dessert"; done
```{{exec}}

What do you notice about this type of counting? does anything stand out as different than conditonal looping? How?

Create a set of number programmatically and loop over them.

You can hit "ctrl + c" to stop these once you've observed them long enough.

```plain
for i in $(seq 1000); do echo "I am counting over $i"; sleep 1; done
```{{exec}}

Can you make it count by 5's?

```plain
for i in $(seq 5 5 1000); do echo "I am counting over $i"; sleep 1; done
```{{exec}}

Remember to stop this if you don't want to watch it complete.

Create a file and populate it with fruit

```plain
echo "apple
banana
pear
grapes" >> fruit.txt
```{{exec}}

Read the list from a file.

```plain
for item in $(cat fruit.txt); do echo "I am reading $item"; done
```{{exec}}

Write the two servers in this lab to a file and then loop over the commands to execute to both servers.

```plain
echo "controlplane
node01" >> /root/servers.txt
```{{exec}}

```plain
for server in $(cat /root/servers.txt); do ssh $server 'hostname; uptime'; done
```{{exec}}

Do you see how this may be useful as a systems administrator to hit multiple nodes? Why or why not?



</details>