Create a service that exposes the nginx-deployment-blue to the internal cluster on port 80. Name it web-service

Verify that the deployment is properly exposed and seeing the pod IPs for nginx-deployment-blue



<br>
<details>
<summary>Solution</summary>
Create a service that exposes the nginx-deployment-blue to the internal cluster.

```plain 
kubectl expose deployment nginx-deployment-blue --port=80 --type=ClusterIP --name=web-service
```{{exec}}

Verify that the deployment is properly exposed and seeing the pod IPs for nginx-deployment-blue
```plain
kubectl describe svc web-service
```{{exec}}

Check the pods for their IP addresses compare them to the endpoints from the above output
```plain
kubectl get pods -o wide | grep blue
```{{exec}}
</details>

