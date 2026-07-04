### Lab Activities

You've installed Warewulf and downloaded an image. Update that server to the newest software that is available in the locally configured repositories.

1. Create an ansible chroots file for modification of environments

2. Write the Ansible that will run your package manager (DNF) to update the server software.

3. Execute and begin the process of updating your image.

<br>
<details>
<summary>Solution</summary>

Create a "hosts file" but with the chrooted environment you want to edit.

```plain
mkdir /root/ansible
cd /root/ansible
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

  - name: push over the correct /etc/resolv.conf
    copy:
      src: /etc/resolv.conf
      dest: /etc/resolv.conf

  - name: Upgrade all packages to the latest version
    ansible.builtin.package:
      name: "*"
      state: latest
```

Execute this against your chrooted environment

```plain
time ansible-playbook -i /root/ansible/chroots update.yml --extra-vars "survey_hosts=chroots"
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

If you see today's date for your most recent update, you can surmise that the system has been updated by your ansible playbook.

</details>