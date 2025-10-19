### Lab Activities

The team needs a quick re-tooling in their dev environment. You've been so successful they come directly to you to get what they need set up. 

They need the following

A user named svc_ansible set up on webservers with a home directory in /var/chroot/svc_ansible instead of the normal location. The user must be added to the admin or wheel group and have the uid of 10001.

<br>
<details>
<summary>Solution</summary>

Create the directory.

```plain
ansible webservers -i /root/hosts -m file -a "path=/var/chroot/svc_ansible state=directory" 
```{{exec}}

Create the svc_ansible user and give them the correct settings in the environments needed.

```plain
ansible webservers -i /root/hosts -m user -a "name=svc_ansible home=/var/chroot/svc_ansible uid=10001 groups=admin"
```{{exec}}

What warnings do you see here? Might you need to fix these? How would you do the fix, if you needed one?


</details>