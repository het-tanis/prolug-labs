### Lab Activities

You have decided to interact with Ansible inventories. 

Execute some playbooks to see their functionality.

Use the tool ansible-inventory to parse and understand your inventories.

<br>
<details>
<summary>Solution</summary>

Run the u3_script.yml and look at what it shows you.

```plain
ansible-playbook /root/u2_script1.yml
```{{exec}}

What are you shown?

Can you modify this output so show other interesting parts of the API calls? If you had to pull a specific field, could you do it? Again, you don't know how data might come to you in your organization, so this is an exercise in parsing things different ways.

Inspect your current inventory files.

```plain
cat /root/hosts
```{{exec}}

```plain
cat /root/hosts_example2
```{{exec}}

```plain
cat /root/hosts_example3
```{{exec}}

What file type are these? (https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html)?

What other file types might you use for inventories?

Do you have a preference on how the data are formatted, or where the variables are located on these?

Do you think some of this looks better formatted or do you prefer it as yaml?

Check the yaml versions of these files.

```plain
ansible-inventory -i /root/hosts --list -y
```{{exec}}

```plain
ansible-inventory -i /root/hosts_example2 --list -y
```{{exec}}

```plain
ansible-inventory -i /root/hosts_example3 --list -y
```{{exec}}

This is a very high level review of the many ansible-inventory commands. It is recommended that you parse and play with these files more, as the concepts will continue to be built on in later labs.


</details>