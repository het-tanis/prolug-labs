Your organization is going to start building out three tier apps. You know that mysql can act as a backend to that architecture. You decided to deploy mysql into a Kubernetes cluster.

Create a PV and PVC to store your mysql data. Make sure it is at least 10 GiB.



<br>
<details>
<summary>Solution</summary>
Create a secret password for mysql root user

```plain 
kubectl create secret generic mysql --from-literal=mysql-root-password='Very$ecure1#'
```{{exec}}

To make this more challenging, or if you're prepping for your CKA, make your own PV and PVC here. Make sure the name includes mysql for lab verification purposes.

Inspect the storage file provided.
```plain
cat /answers/mysql-storage.yaml
```{{exec}}

Deploy the storage file provided.
```plain
kubectl create -f /answers/mysql-storage.yaml
```{{exec}}

Inspect the resources that were created

```plain
kubectl get secrets
```{{exec}}

```plain
kubectl get pv,pvc
```{{exec}}

But you may have noticed that you are not able to read the password from the secret, so let's read and decrypt that password.

```plain
kubectl describe secret mysql
```{{exec}}

That only tells you the general information, to see the secret you have to output the secret's data

```plain
kubectl get secret mysql -o jsonpath='{.data}'
```{{exec}}

But you can't read that because it's base64 encoded and you have to decode it.

```plain
echo '<value from above>' | base64 --decode
```

Executing that should show you the password for your database secret.

</details>
