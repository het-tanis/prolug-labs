### Lab Activities

You deployed a NFS server by hand over in [Configure NFS Share](https://killercoda.com/het-tanis/course/Linux-Labs/100-configure-nfs-share). Now your team needs to deploy the NFS to multiple new servers through an automated process.

Write or copy over the tasks/main.yml for the role nfs_client and use it to create the client mount points with Ansible.

Verify that the mount point is working properly.

<br>
<details>
<summary>Solution</summary>

Copy in the playbook tasks for the NFS client and mount point deployment.

```plain
cp /answers/nfs_client_main.yaml /root/ansible/roles/nfs_client/tasks/main.yml
```{{exec}}

Inspect the files you have created to see what they should do.

```plain
cat /root/ansible/roles/nfs_client/tasks/main.yml
```{{exec}}

Deploy the ansible playbook and see the client deployment.

```plain
ansible-playbook -i /root/hosts /root/ansible/nfs_deploy.yaml
```{{exec}}

Is this the exact same deployment from earlier? Why or why not? Is the command that you're executing exactly the same?

Check that the mount point has been properly mounted on your local system.

```plain
mount | grep -i nfs | grep -i share
cat /etc/fstab
```{{exec}}

Is the filesystem mounted? How does the /etc/fstab entry look to you? Would you have built it that same way?

</details>