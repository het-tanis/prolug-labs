Troubleshoot Application Failure

Launch a pod with a busybox container that has the awake 5000 command running. (This command doesn't exist.)

Get the logs from the pod and save them at /tmp/awake.log, then correct the error to make it launch sleep 3600

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [Application Debug](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)

Awake file can be found at /answers/awake.yaml
Corrected Sleep file can be found at /answers/sleep.yaml

</details>

<details>
<summary>Solution</summary>

Create the file via an imperative command

```plain 
kubectl run sleep --image=busybox --command -- awake 5000
```{{exec}}

Verify that this pod doesn't correctly start

```plain
kubectl get pod sleep
```{{exec}}

What about in the logs?

```plain
kubectl logs sleep | tee -a /tmp/awake.log
```{{exec}}

Delete the broken pod

```plain
kubectl delete pod sleep --force --grace-period=0
```{{exec}}

Fix and deploy the working pod

```plain
kubectl run sleep --image=busybox --command -- sleep 3600
```{{exec}}

</details>
