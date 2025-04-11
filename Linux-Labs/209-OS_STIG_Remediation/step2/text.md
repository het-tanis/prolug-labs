You are now ready to run the playbook and see the effect on the server.

Make the script to kick off the playbook executable.

Execute the script and watch the Ansible playbook run.

<br>

### Solution
<details>
<summary>Solution</summary>

Change back to the correct directory

```plain
cd /root/stigs/ansible
```{{exec}}

Verify the enforce.sh file is correct.

```plain
more enforce.sh
```{{exec}}

Make the enforce.sh script executible.

```plain
chmod 755 enforce.sh
```{{exec}}

Run the playook and see the output.

```plain
time ./enforce.sh
```{{exec}}

About how long did the playbook run for?

Did the playbook break, or did it complete execution?

If it does fail, where is it failing? If it's on a handler, does that really matter to the hardening of a system? Does the answer change if it's a virtual or physical machine?


</details>
