### Lab Activities

You deployed a NFS server by hand over in [Configure NFS Share](https://killercoda.com/het-tanis/course/Linux-Labs/100-configure-nfs-share). Now your team needs to deploy the NFS to multiple new servers through an automated process.

Verify your /root/hosts file, /root/remove_packages.j2 and /root/remove_packages.yaml files. 

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
```{{exec}}

</details>