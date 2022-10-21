Verify labels and change service web-service to point to green deployment



<br>
<details>
<summary>Solution</summary>
Verify Pod Labels

Look at Selector for web-service
```plain
kubectl describe svc web-service
```{{exec}}

View the labels assigned and compare them to web-service selector
```plain
kubectl get pods --show-labels | grep -E "blue|green"
```{{exec}}

Edit Selector for web-service to be app=nginx-green
```plain
kubectl edit svc web-service
```{{exec}}

Verify that pod IPs are the same endpoints to the service
Verify that web-service is using Selector nginx-green
```plain
kubectl get pods -o wide | grep green
kubectl describe svc web-service
```{{exec}}
</details>