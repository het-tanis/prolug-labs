Now you're ready to setup the application and data portions of your three tier app.

Create the Flask application and expose it via an ingress controller. 

Create the mysql database and load it with sample data.

Test the ingress connection to your application.

Test the basic application functionality to the database.


<br>
<details>
<summary>Solution</summary>
Create the flask docker container image for our application.

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

