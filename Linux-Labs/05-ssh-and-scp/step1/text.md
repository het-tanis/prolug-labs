Connect to the other server and look at the specifics of the ssh connection.

<br>

### Solution
<details>
<summary>Solution</summary>
Check your ip address

```plain
ssh node01
```{{exec}}

Type in exit to return to the original system

```plain
ssh -v node01 'uptime'
```{{exec}}

What additional information was shown with the -v option? (debug1)

```plain
ssh -vv node01 'uptime'
```{{exec}}

What additional information was shown with the -vv option? (debug2)

```plain
ssh -vvv node01 'uptime' 
```{{exec}}

What additional information was shown with the -vvv option (debug3)

So we looked at a ssh connection over to node01. You should note that the keys are being used and that is why no password was asked to connect. We'll explore that more shortly.
 
</details>