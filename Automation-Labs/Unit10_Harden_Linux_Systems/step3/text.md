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

Setup the environment for STIGs

```plain
mkdir /root/stig
cd /root/stig
```{{exec}}

Download the STIG Remediation tool for Rocky 9

```plain
wget -O U_RHEL_9_V2R4_STIG_Ansible.zip https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_RHEL_9_V2R4_STIG_Ansible.zip
unzip U_RHEL_9_V2R4_STIG_Ansible.zip
```{{exec}}

Make a directory location and move the RHEL9STIG for Ansible in there.

```plain
mkdir ansible
cp rhel9STIG-ansible.zip ansible/
cd ansible
unzip rhel9STIG-ansible.zip
```{{exec}}

Move into the correct directory

```plain
cd /root/stig/ansible
```{{exec}}

Fix the hosts in the main.yml to point to chrooted environment

```plain
vi main.yml
```{{exec}}

hit "i" to enter insert mode and chnge the top line as follows

```plain
- hosts: chroots
```

Execute this against your chrooted environment

```plain
ansible-playbook -i /root/ansible/chroots site.yml
```{{exec}}

What does run, and what breaks? Why do you think this STIG Ansible playbook breaks? What does the error message tell you?

This is where the iterative process of image build starts to take shape. We need to approximately do these steps (outside of the scope of this lab)

1. Harden the image, as above
2. Deploy the system to a live node
3. Run your regression and function checks to ensure your base functionality still exists.
  3a. If 3 passes, then run your STIG reports and see if you're at the minimum standard.
4. Repeat until functionality and minimum baseline are achieved.


</details>