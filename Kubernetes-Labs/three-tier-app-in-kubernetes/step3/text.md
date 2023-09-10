Now the application needs security.

Create network policies that limit all traffic into data1 to only pods in the namespace app1.

Make the app1 test and read pods read only filesystems that are not run as the root user.

<br>
<details>
<summary>Solution</summary>

Examine the network policy to deny anything into data1

```plain
cat /root/security/network_policy_deny.yaml
```{{exec}}

Examine the network policy to allow app1 pods to communicate in on port 3306

```plain
cat /root/security/network_policy_allow_app1.yaml
```{{exec}}

Apply the polcies.

```plain
kubectl create -f /root/security/network_policy_deny.yaml
```{{exec}}

```plain
kubectl create -f /root/security/network_policy_allow_app1.yaml
```{{exec}}

Test communication is still working for the application

Test that you are able to see your application in action.

```plain
curl application.lab.mine:30080/test
curl application.lab.mine:30080/read
```{{exec}}

Create a mysql image in the default namespace and verify that it no longer connects.

```plain
kubectl run mysql-client --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash
```{{exec}}

```plain
mysql -h mysql-service.data1.svc.cluster.local -uroot -p'Very$ecure1#' -e 'use visitors; show tables; select * from persons'
```{{exec}}

Create one in the app namespace and verify it connects.

```plain
kubectl run mysql-client -n app1 --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash
```{{exec}}

```plain
mysql -h mysql-service.data1.svc.cluster.local -uroot -p'Very$ecure1#' -e 'use visitors; show tables; select * from persons'
```{{exec}}

Redeploy the read application in a secure fashion.

```plain
kubectl delete pod read-app1 -n app1
```{{exec}}

Check the new deployment for added security of non-root user and disallowed privilege escalation

```plain
cat /root/security/secure-read-app1.yaml
```{{exec}}

Deploy the application and verify connectivity

```plain
kubectl create -f /root/security/secure-read-app1.yaml
```{{exec}}

```plain
curl application.lab.mine:30080/read
```{{exec}}
