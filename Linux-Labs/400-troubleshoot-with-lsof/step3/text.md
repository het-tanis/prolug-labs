Use lsof to examine the filesystems on your Linux server. If something doesn't work, troubleshoot the situation to see if you can resolve it.

<br>

### Practice
<details>
<summary>Solution</summary>
Use the lsof to check the processes using a directory.

```plain
lsof /mnt
```{{exec}}

You should see no processes using the /mnt directory. There is no output.

Move to the /mnt directory

```plain
cd /mnt
```{{exec}}

Use lsof to check the processes using a directory.

```plain
lsof /mnt
```{{exec}}

What is different now that you're in the directory?

Check the process ID of your shell.

```plain
echo $$
```{{exec}}

Do you see your process ID in the /mnt directory?

Try to unmount the /mnt directory

```plain
umount /mnt
```{{exec}}

Did it work? Why or why not? What is the system saying?

There are two ways to unmount this directory now. We can force it with a lazy unmount

```plain
umount -l /mnt
```{{exec}}

Did this work?

Now try to use pwd to see the directory you're in.

```plain
pwd
```{{exec}}

What error do you see? Can you fix it? (Note: IF you do not see an error, this is because this is an unsafe action you're doing that is not recommended. I just had you do it to see the behavior.)

```plain
cd /mnt
pwd
```{{exec}}

Did the error go away? Is the filesystem properly unmounted from the other node?

Use lsof to examine what files a process is using. We'll look for sshd, as we know it's running on the system.

Capture the process ID (PID) of the sshd daemon in the second command.

```plain
ps -ef | grep [s]shd
sshdPid=$(ps -ef | grep [s]shd | awk '{print $2}')
```{{exec}}

Check what files and file handles that the process for sshd has open.

```plain
lsof -p $sshdPid
```{{exec}}

What are the types of FD values that you see?
What are the common names of files you see?

At the bottom you see that sshd is listening on :ssh. Find the port number for ssh.

```plain
grep ssh /etc/services
```{{exec}}

What is the port number for ssh?

Check using lsof for the process or processes that are holding open port 22 on your system.

```plain
lsof -i :22
```{{exec}}

Do you see the same process for sshd that you saw earlier?

Look up the process by name.

```plain
lsof -c sshd
```{{exec}}

Do you see the same information that you saw earlier when you used the Process ID (PID)?

Use lsof to inspect what processes a terminal is running.

```plain
ssh controlplane
w
```{{exec}}

What is the TTY terminal? pts/2 for example

Examine the terminal for open filesystems

```plain
lsof /dev/pts/2
```{{exec}}

Can you see what your terminal is executing?

Execute a sleep command for 10 minutes and then validate that you can see your command running.

```plain
sleep 600 &
```{{exec}}

Now lsof to see just your user's sleep commands

```plain
lsof -u root -ac sleep
```{{exec}}

Do you see your sleep command?
What other information do you find useful?

Can you find out what the -ac does in that command?

```plain
man lsof
```{{exec}}

What does the -ac mean?

Use "q" to exit.

</details>