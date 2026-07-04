### Lab Activities

You've installed Warewulf and downloaded an image. Harden that image to a STIG standard (or you can use CIS Benchmarks if you want to modify)

1. Create an ansible chroots file for modification of environments

2. Download the RHEL 9 stig baseline tool for Ansible

3. Execute and begin the process of hardening your image.

<br>
<details>
<summary>Solution</summary>

Create a "hosts file" but with the chrooted environment you want to edit.

```plain
mkdir /root/ansible
vi /root/ansible/chroots
```{{exec}}

Add the following lines to this file

```plain
[chroots]
/var/local/warewulf/chroots/my-rocky-image/rootfs/ ansible_connection=chroot
```

Make sure you hit "esc" :wq or some other "save" inside of vi.

Write a simple update for DNF in Ansible for the my-rocky-image

```plain
vi /root/ansible/update.yml
```{{exec}}

Add the following lines to the playbook.

```plain
---

- name: Upgrade Packages
  hosts: "{{survey_hosts}}"
  vars:
  gather_facts: True
  become: True
  tasks:

  - name: Upgrade all packages to the latest version
    apt:
      name: "*"
      state: latest
```

Execute this against your chrooted environment

```plain
ansible-playbook -i /root/ansible/chroots update.yml --extra-vars "survey_hosts=chroots"
```{{exec}}

What does run, and what does it show? 

Can you exec into the shell and verify that it has recently been updated?

```plain
wwctl image shell my-rocky-image
```{{exec}}

And then validate the changes

```plain
dnf history
```{{exec}}


</details>