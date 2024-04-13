### Lab Activities
Your team has a deployment of a web server and database environment. They want to secure the environment so that only the ports that should be exposed are exposed on the correct servers. You have researched and found that UFW can do this and you can configure it with Ansible in a playbook.

Setup the servers to expose the correct port numbers. 

Web Server - Port 22, 80

DB Server - Port 22, 3306

Make sure that you can connect to those servers on the exposed ports.

You may try to complete this activity yourself, or you may find the answers in the Solution below.

<br>

<details>
<summary>Solution</summary>

Check your hosts file

```plain
cat /root/hosts
```{{exec}}

Check on the environment deployer, or compare it to what you tried to write. How do they compare? How do they differ?

```plain
cat /root/packages_install.yaml
```{{exec}}

Execute the packages_install.yaml to set up your web and db environments.

Run against the [servers] host group

```plain
ansible-playbook -i /root/hosts /root/packages_install.yaml
```{{exec}}

When this executes, do you notice that it skips servers? Why is it doing this, and is it expected?

Verify that you have all the expected ports open on both servers

```plain
timeout 3 nc -vz node01 80
timeout 3 nc -vz node01 22
timeout 3 nc -vz node01 40200
timeout 3 nc -vz controlplane 3306
timeout 3 nc -vz controlplane 22
timeout 3 nc -vz controlplane 40200
```{{exec}}

If this has all worked, you've completed this part of the lab and are ready to move on.

</details>