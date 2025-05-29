So far you have enabled rsyslog collection on controlplane on TCP Port 6514. 

Now you must configure the node01 server to securely send logs over the correct port.

<br>

### Solution
<details>
<summary>Solution</summary>
You can now test the keys between two systems.

Create a user prolug on node01

```plain
ssh node01
```{{exec}}

Create a user prolug

```plain
useradd -m prolug
```{{exec}}

Make a password (1234)

```plain
passwd prolug
```{{exec}}

Exit node01 back to controlplane

```plain
exit
```{{exec}}

Copy over your generated key

```plain
ssh-copy-id -i ProLUG prolug@node01
```{{exec}}

Enter the password you used earlier for prolug (1234)

Test your connection

```plain
ssh -i ProLUG prolug@node01
```{{exec}}

Verify that the key is the one being used with -v

```plain
ssh -v -i ProLUG prolug@node01
```{{exec}}

Do you see your key being accepted in the verbose debug1 output?


</details>
