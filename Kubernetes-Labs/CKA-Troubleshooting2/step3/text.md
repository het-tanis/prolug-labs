Install metrics server and show metrics for nodes and pods in all namespaces

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [Metrics Pipeline](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/)

</details>

<details>
<summary>Solution</summary>

Download metrics server
```plain
git clone https://github.com/kubernetes-sigs/metrics-server
```{{exec}}

For this to work, you will need to edit a file found at metrics-server/manifests/base/deployment.yaml

The added line allows for insecure TLS connections. Without it, the components will not work correctly in the lab.

We've included the corrected file in /answers/deployment.yaml
```plain
cp /answers/deployment.yaml metrics-server/manifests/base/deployment.yaml
```{{exec}}

Deploy the metrics server

```plain
kubectl apply -k metrics-server/manifests/base/
```{{exec}}

Watch for the metrics-server to come available
```plain
kubectl get pods -n kube-system
```{{exec}}

DO NOT Continue until the above step shows the metrics-server 1/1 ready state. This may take upwards of 30 seconds.

Once this has deployed, you should be able to use top command against the nodes and the pods

```plain
kubectl top nodes
```{{exec}}

Which node is using the most cpu and memory?

You can actually use a sort command to find this quickly

```plain
kubectl top nodes --sort-by=cpu
```{{exec}}

```plain
kubectl top nodes --sort-by=memory
```{{exec}}

Now find all the metrics for the pods
```plain
kubectl top pods -A
```{{exec}}

Which pod is using the most resources? Why do you think that is?

</details>