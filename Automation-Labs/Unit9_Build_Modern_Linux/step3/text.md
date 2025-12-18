### Lab Activities

You've installed Warewulf and downloaded an image. Test that you can do the following activities.

1. Modify the image directly in the chrooted environment

2. Modify the image via and automated Ansible process

3. Build the image and verify that Warewulf has taken the changes.

<br>
<details>
<summary>Solution</summary>

Manually modify the "my-rocky-image" image from outside of Warewulf and the chroot environment.

```plain
cd /var/local/warewulf/chroots/my-rocky-image/etc/
```{{exec}}

vi the file that we want to change.

```plain
vi resolv.conf
```{{exec}}

Add in the line 

```plain
nameserver 8.8.8.8.
```

Make sure you hit "esc" :wq or some other "save" inside of vi.

This value will now be taken when the image is chrooted into, and the DNF can find the baseurl for the repo.

Setup an Ansible playbook to modify the image in a chrooted environment.

```plain
mkdir /root/ansible
cd /root/ansible
```{{exec}}

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

Create a playbook that will modify that image in a chrooted environment.


```plain
vi /root/ansible/package.yaml
```{{exec}}

Add the following lines

```plain
- name: Update my image for compliance
  hosts: chroots
  become: true  

  tasks:
    - name: Ensure telnet package is installed
      package:
        name: telnet
        state: present

    - name: Remove tftp-server from image		  
      ansible.builtin.package:
        name: tftp-server
        state: absent
```

Make sure you hit "esc" :wq or some other "save" inside of vi.

Run the playbook and verify that it modifies the image.

```plain
ansible -i /root/ansible/chroots /root/ansible/package.yaml
```{{exec}}

Do you see the proper change applied to the chroot environment? 

How do you know?

Build the image in warewulf

```plain
wwctl image build my-rocky-image
```{{exec}}

</details>