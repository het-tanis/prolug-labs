
This lab is part of a larger presentation given to ProLUG and Redline Perfomance Solutions. It is standalone, but more context can be found on the discord of the ProLUG group.

Your organization has tasked you to build a modern three tier application using Kubernetes. You have decided to use Nginx, Flask, and MySQL to build a basic POC (Proof of Concept) of the idea.

Your organization would like the minimum level of security applied that follows best practice industry standards for Kubernetes pod deployments.

Get started by setting up the namespaces, storage, and secrets you will need for your application. 

Set up Namespaces

Set up storage

Set up secrets


<br>
<details>
<summary>Solution</summary>
Check and then setup namespaces for your application.

Get current namespaces.

```plain 
kubectl get ns
```{{exec}}

Create planned namespaces.

```plain 
kubectl create namespace app1
kubectl create namespace data1
```{{exec}}

Check current namespaces again.

```plain 
kubectl get ns
```{{exec}}

Create a secret to use with the mysql database.

```plain 
kubectl create secret generic mysql --from-literal=mysql-root-password='Very$ecure1#' -n data1
```{{exec}}

Inspect the secret that was created.

```plain
kubectl get secrets -n data1
```{{exec}}

Inspect the storage file provided.

```plain
cat /root/mysql/mysql-storage.yaml
```{{exec}}

What are the two items being created?

Deploy the storage file provided.

```plain
kubectl create -f /root/mysql/mysql-storage.yaml
```{{exec}}

Inspect the resources that were created.

```plain
kubectl get pv
kubectl get pvc -n data1
```{{exec}}

Check that the ingress controllers are setup and available.

```plain
kubectl get all -n ingress-nginx
```{{exec}}

Verify that docker registry is running

```plain
docker ps
```{{exec}}

You should see docker running on port 5000 for the local image registry.

Verify that there is a host entry in /etc/hosts for our ingress controller to resolve to.

```plain
grep app /etc/hosts
```{{exec}}

Do you see the line for the application hostname?

If everything is deployed, you're ready to go onto the next part of this lab.

</details>