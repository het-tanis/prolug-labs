Your team has decided to investigate this concept of "Event Driven Architectures". You've been asked to deploy Kafka in kubernetes in a development cluster to facilitate this testing. Your research told you that you need Zookeeper to get Kafka working properly.

Create a namespace ` kafka `. Deploy all resources into this namespace.

Create a NodePort service for Zookeeper with Nodeport 30900

Create a deployment for Zookeeper that uses the default Zookeeper port 2181 and uses the latest image of zookeeper.

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [Zookeeper](https://hub.docker.com/_/zookeeper)

Answer file can be found at /answers/zookeeper.yaml

</details>

<details>
<summary>Solution</summary>

Create the namespace kafka

```plain
kubectl create ns kafka
```{{exec}}

Verify that your namespace is created

```plain
kubectl get all -n kafka
```{{exec}}

Check the file /answers/zookeeper.yaml and verify that service and deployment are correct.

```plain
cat /answers/zookeeper.yaml
```{{exec}}

Notice that the zookeeper service is created first and then the deployment? Sometimes order matters, but in this case it does not. Deploy the zookeeper deployment and service.

```plain
kubectl create -f /answers/zookeeper.yaml
```{{exec}}

Verify that everything is working properly

```plain
kubectl get all -n kafka
```{{exec}}

Wait and run that command a few times to see taht zookeeper is started. Descibe the services and pods to see their details.

```plain
kubectl describe -n kafka svc zookeeper-service
```{{exec}}

This should map to the IP address of the pod that you check as follows.

```plain
kubectl describe pod -n kafka
kubectl get pod -n kafka -o wide
```{{exec}}

These above commands only work because the pod is the only one deployed so far, when you deploy more resources, you will have to name them in those commands. But for now we know we have zookeeper working and we're ready to go on and deploy kafka.

</details>