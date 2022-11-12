Verifying Kubelet and node readiness

Verify that both nodes are ready according to Kubernetes. If they are not, figure out why.

Check that kubelet is running correctly on your controlplane and node01 servers. If it is not, start it.

Fix kubelet on your node01 (make sure it is started and that it is going to start on future reboots)

<br>

<details>
<summary>Solution</summary>
Verify that both nodes are ready

```plain 
kubectl get nodes
```{{exec}}

You see that node01 is not ready

Let's fix node01 server

```plain
ssh node01
```{{exec}}

```plain
systemctl status kubelet
```{{exec}}

Kubelet is not running, so let's start it.
We also see that it is not enabled, so we need to ensure that it is enabled on future system restarts

```plain
systemctl start kubelet
systemctl enable kubelet
```{{exec}}

Verify it is started

```plain
systemctl status kubelet
```{{exec}}

Exit back to controlplane node
```plain
exit
```

Verify that both nodes are in a ready state
```plain
kubectl get nodes
```{{exec}}

</details>