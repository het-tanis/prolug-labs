### Lab Activities

You have decided to verify and test Ansible on your system.

Verify your version of Ansible

Check other Ansible commands that are on the system

Check your modules that are available

<br>
<details>
<summary>Solution</summary>

Verify your version of Ansible
```plain
ansible --version
```{{exec}}

Check other ansible commands on your system

Type in ansible- and then hit <tab>
```plain
ansible- #hit<tab>
```

Check modules in ansible

```plain
ansible-doc -l
```{{exec}}

hit "q" to exit

```plain
ansible-doc -l | wc -l
```{{exec}}

Check for the copy modules

```plain
ansible-doc -l | grep -i copy
```{{exec}}

Can you find ansible.builtin.copy? How might you find out what that module does?

```plain
ansible-doc -s ansible.builtin.copy
```{{exec}}

What is shown by this command? use "q" to exit

</details>