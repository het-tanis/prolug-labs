You have verified the basics of your key operation, but now you want to test them between two machines.

1. Create a user to push the key to and test with.

2. Push the key and validate that it works for allowing access to the user on the remote system.

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

Look at where the key was pushed to in the prolug user home directory.

```plain
ls -ld /home/prolug/.ssh
```{{exec}}

What is the permission that is set on the .ssh directory?

```plain
cd /home/prolug/.ssh
```{{exec}}

```plain
ls -l
```{{exec}}

What is the name of the file in .ssh directory?
What permissions do you see on the file?

```plain
cat authorized_key
```{{exec}}

What was pushed into authorized keys?

Exit back to controlplane

```plain
exit
```{{exec}}

Verify that the key is the one being used with -v

```plain
ssh -v -i ProLUG prolug@node01
```{{exec}}

Do you see your key being accepted in the verbose debug1 output?

Exit back to controlplane

```plain
exit
```{{exec}}


</details>
