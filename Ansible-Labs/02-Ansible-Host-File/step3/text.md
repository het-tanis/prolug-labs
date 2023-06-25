Your team is going to be adding new servers to the environment that haven't been built yet. Update your inventory file at /root/hosts to reflect the new environments.

Update the /root/hosts file

use ansible-inventory commands to view the file values.


<br>
<details>
<summary>Solution</summary>

Update the /root/hosts file to have a test and prod environment.

vi /root/hosts and then esc : wq to save.

```plain
[servers]
controlplane
node01

[test_env]
controltest type=client
node01test  type=server

[prod_env]
controlprod type=client
node01prod  type=server

[non-prod:children]
servers
test_env
```

Now that you've updated the inventory for the new systems, view the inventory with ansible-inventory to see the host groups.

```plain
ansible-inventory -i /root/hosts --list
```{{exec}}

To see that in graph output use this command.

```plain
ansible-inventory -i /root/hosts --graph
```{{exec}}

To see that in yaml output.

```plain
ansible-inventory -i /root/hosts --list -y
```{{exec}}

Which of those output were most useful to you? Which of them do you think you'd like to see or use for your evironments?


</details>
