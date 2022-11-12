Create an nginx pod with a liveness and readiness probe for port 80

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Answer file can be found at /answers/readiness-pod.yaml

</details>

<details>
<summary>Solution</summary>

Create this yaml file and then run kubectl create -f filename

```plain 
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    run: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 5
    livenessProbe:
      httpGet:
        path: /
        port: 80
```

Verify that the pod starts correctly
```plain
kubectl get pods nginx
```{{exec}}

View the Liveness and Readiness status in pod description
```plain
kubectl describe pods nginx
```{{exec}}

</details>