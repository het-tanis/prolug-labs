### Lab Activities

You deployed a NFS server by hand over in [Configure NFS Share](https://killercoda.com/het-tanis/course/Linux-Labs/100-configure-nfs-share). Now your team needs to deploy the NFS server and client mount points to multiple new servers through an automated process.

Verify your /root/hosts file and see that you have defined variables for type in this deployment.

Create a galaxy structure and write or copy in the answers of the tasks and handlers for deploying the NFS server.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

Create a structure for a role based deployment with Ansible Galaxy.

```plain
mkdir -p /root/ansible/roles
cd /root/ansible/roles
```{{exec}}

create your ansible galaxy structures

```plain
ansible-galaxy init nfs_server
ansible-galaxy init nfs_client
```{{exec}}

Copy in the ansible playbook with the inherited roles.

```plain
cp /answers/nfs_deploy.yaml /root/ansible/nfs_deploy.yaml
```{{exec}}

Inspect the playbook. Does it make sense that the roles are going to be inherited if certain conditions about the servers are met? Those can come from an inventory or an environment file to define what servers inherit what roles.

```plain
cat /root/ansible/nfs_deploy.yaml
```{{exec}}

Copy in the playbook tasks and handlers for the NFS server deploy

```plain
cp /answers/nfs_server_task_main.yaml /root/ansible/roles/nfs_server/tasks/main.yml
cp /answers/nfs_server_handler_main.yaml /root/ansible/roles/nfs_server/handlers/main.yml
```{{exec}}

Inspect the files you have created to see what they should do.

```plain
cat /root/ansible/roles/nfs_server/tasks/main.yml
echo "----------"
cat /root/ansible/roles/nfs_server/handlers/main.yml
```{{exec}}

Execute the playbook and see the deployment of the server.

```plain
ansible-playbook -i /root/hosts /root/ansible/nfs_deploy.yaml
```{{exec}}

What output do you see? What happens if you run this again?

Check that the server has been started on node01 and a filesystem has been shared out.

```plain
ssh node01 'hostname; showmount -e'
```{{exec}}

</details>