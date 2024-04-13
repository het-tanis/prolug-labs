### Lab Activities
You've been extremely successful. Now we need to secure the environment so that nothing else can connect on any of the other ports that are not allowed.

Use UFW Module in Ansible to secure the two servers as required by your GRC (Governance, Risk, and Compliance) Security Team.

Setup the UFW to only allow the correct port numbers. 

Web Server - Port 22, 80

DB Server - Port 22, 3306

You may try to write the playbook yourself, or use the solution below to see the answer and watch it work in your environment.

<br>
<details>
<summary>Solution</summary>

Check the file /root/ufw_setup.yaml to see how to setup the firewall for the required exposed ports.

```plain
cat /root/ufw_setup.yaml
```{{exec}}

Inspect the ufw_setup.yaml file. What is the purpose of each of the tasks in the playbook? Which do you expect to run on both servers? Which do you expect to only run on some servers? Why?

Run the file to see what happens and verify operations.

```plain
ansible-playbook -i /root/hosts /root/ufw_setup.yaml
```{{exec}}

Now you can test and see that only the ports that you expect to be available are able to be connected to.

Verify the configurations of the firewalls are different:

```plain
ufw status
ssh node01 'ufw status'
```{{exec}}

Are they configured like you would expect? Why or why not?

```plain
timeout 3 nc -vz node01 80
timeout 3 nc -vz node01 22
timeout 3 nc -vz controlplane 3306
ssh node01 'timeout 3 nc -vz controlplane 22'
```{{exec}}

The above should work, the items below should time out.

```plain
timeout 3 nc -vz node01 40200
```{{exec}}

```plain
ssh node01 'timeout 3 nc -vz controlplane 40200'
```{{exec}}

Did you see the timeouts on the ports that you expect to? Did this deployer act as you expected? What could you do to improve this operation?

</details>
