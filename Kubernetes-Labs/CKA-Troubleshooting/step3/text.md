Scale the deployment nginx-deployment-canary to have 8 replicas

Verify labels and change service web-service to point to Both deployments at 80% canary and 20% canary v2.

<br>
<details>
<summary>Solution</summary>

Scale up canary deployment
```plain
kubectl scale deployment nginx-deployment-canary --replicas=8
```{{exec}}

Look at Selector for web-service
```plain
kubectl describe svc web-service
```{{exec}}

View the labels assigned and compare them to web-service selector
```plain
kubectl get pods --show-labels | grep canary
```{{exec}}

Note the v1 and v2 versions

Edit Selector for web-service and remove the version selector
```plain
kubectl edit svc web-service
```{{exec}}

Verify that pod IPs are the same endpoints to the service
```plain
kubectl get pods -o wide | grep canary
kubectl describe svc web-service
```{{exec}}

Once you've verified that traffic is going to both, edit Selector for web-service and add the `version: v2` selector 
```plain
kubectl edit svc web-service
```{{exec}}

Verify that pod IPs are for V2 of canary no longer v1
```plain
kubectl get pods -o wide --show-labels| grep v2
kubectl describe svc web-service
```{{exec}}
</details>