### Lab Activities

You cleaned up the golden image over in lab [Updating Golden Image](https://killercoda.com/het-tanis/course/Linux-Labs/203-updating-golden-image). Now your team needs you to deploy that change to all the active systems.

Verify your /root/hosts file, /root/remove_packages.j2 and /root/remove_packages.yaml files. 

Remove the bzip2 and containerd packages from all servers to ensure that old software is no longer on your systems and to stop developer abuse of containerd on all systems.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

```plain
cat /root/remove_packages.yaml
```{{exec}}

You may want to remove the commented debug variables before you run this. What are the individual tasks attempting to do with this playbook?

Now that we've reviewed the playbook, let's look at the Jinja2 template that will be stamped to this server at the end of the execution.

```plain
cat /root/remove_packages.j2
```{{exec}}

What are the variables being used? what are the expected outcomes?

Run the playbook to see the removal of packages from all servers.

```plain
ansible-playbook -i /root/hosts /root/remove_packages.yaml
```{{exec}}

Did the playbook execute with no issues? If it did not, run it again and see what the output is.

Verify the output of the reports that you've run.

```plain
for report in $(ls /root/*report*.txt); do echo "checking $report"; cat $report; done
```{{exec}}

Are the output reports what you expected? Why or why not?

</details>