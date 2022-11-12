Look at the logs for the following servers

API Server

Controller Manager

Scheduler

Save the logs into /tmp/scheduler.log

<br>

<details>
<summary>Solution</summary>

View the logs of the API Server

```plain 
kubectl -n kube-system logs kube-apiserver-controlplane
```{{exec}}

View the logs of the Controller Manager

```plain
kubectl -n kube-system logs kube-controller-manager-controlplane
```{{exec}}

Do you see the errors from step 1 on node01?

View the logs of the Scheduler and send them out to a file called /tmp/scheduler.log
```plain
kubectl -n kube-system logs kube-scheduler-controlplane | tee -a /tmp/scheduler.log
```{{exec}}

Notice that all of the names are appended with controlplane? That's because they're static pods whose manifests exist in /etc/kubernetes/manifests on the controlplane node

```plain
ls /etc/kubernetes/manifests/
```{{exec}}

</details>
