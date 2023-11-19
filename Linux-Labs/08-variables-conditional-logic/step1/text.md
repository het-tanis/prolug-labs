You are a new system administrator at a company. You've decided that you need to start gathering system information so you can use it in scripts. You know that this will give you more capabilities for automation and collection of system state.

Check your bash environment variables

Create some variables with system data

Output those variables to the screen

<br>

### Solution
<details>
<summary>Solution</summary>
Check your environmental variables

```plain
printenv
```{{exec}}

Also

```plain
env
```{{exec}}

and also 

```plain
declare -p
```{{exec}}

and also 

```plain
set
```{{exec}}

Is there any difference between the two above commands? How can you prove it?

```plain
printenv | wc -l
env | wc -l
declare -p | wc -l
set | wc -l
```{{exec}}

Test the output of a variable named `$name`

```plain
echo $name
```{{exec}}

Did that give any output, why or why not?

Let's populate that variable with some information

```plain
uname
name=$(uname)
```{{exec}}

Test the output of a variable named `$name`

```plain
echo $name
```{{exec}}

Can you capture whether or not processes are running? Test for httpd and sshd.

```plain
ps -ef | grep -i [h]ttpd
httpdCheck=$(echo $?)
```{{exec}}

```plain
ps -ef | grep -i [s]shd
sshdCheck=$(echo $?)
```{{exec}}

Can you verify that they're correct? Which one is running and which one is not running?

(httpd is not running and sshd is running)




</details>