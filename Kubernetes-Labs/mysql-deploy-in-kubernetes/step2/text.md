Create a service that exposes the mysql pod to the internal cluster on port 3306. Name it mysql-service.

Create a deployment that runs a mysql pod that is listening on port 3306. Ensure that the resources come up correctly.


<br>
<details>
<summary>Solution</summary>
Inspect the deployment and service file provided.

```plain
cat /answers/mysql-file.yaml
```{{exec}}

You may choose to write your own deployment and service, if you're preparing for the CKA or CKAD examinations. In that case, make sure the service is named mysql-service.

Do you see the mysql deployment and service? How does the service know to use the deployment pod as it's endpoint?

Deploy the service file provided.
```plain
kubectl create -f /answers/mysql-file.yaml
```{{exec}}

Inspect the resources that were created

```plain
kubectl get svc
kubectl describe svc mysql-service
```{{exec}}

```plain
kubectl get deployments
kubectl get pods -o wide --show-labels
```{{exec}}

Do you see that the pod IP is the same IP as the endpoint of the service? Do you see that the label on the pod matches the selector from the service?

</details>

