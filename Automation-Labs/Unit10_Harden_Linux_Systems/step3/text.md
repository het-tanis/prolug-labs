### Lab Activities

You've installed Warewulf and downloaded an image. Test that you can do the following activities.

1. Modify the image directly in the chrooted environment

2. Modify the image via and automated Ansible process

3. Build the image and verify that Warewulf has taken the changes.

<br>
<details>
<summary>Solution</summary>

Create a "hosts file" but with the chrooted environment you want to edit.

```plain
vi /root/ansible/chroots
```{{exec}}

Add the following lines to this file

```plain
[chroots]
/var/local/warewulf/chroots/my-rocky-image/rootfs/ ansible_connection=chroot
```

Make sure you hit "esc" :wq or some other "save" inside of vi.



Setup the environment for openscap

```plain
cd /root
mkdir openscap
cd openscap
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
```{{plain}}

Look at some of the STIGs you can use against the chrooted environment.

```plain
cd /root/stigs/ansible/roles/rhel9STIG/defaults/
vim main.yml
```{{exec}}



```plain
rpm -qi telnet
```{{exec}}

Can you see that the package was recently installed?

You may now complete the lab.

</details>