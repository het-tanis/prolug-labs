Now that you have a namespace for kafka and zookeeper running, we can work to deploy Kafka in our environment. We normally wouldn't use a NodePort for this, but for testing in the lab, it's alright.

Deploy all resources into kafka namespace

Create a nodeport service named ` kafka-service ` on external port ` 31000 ` that exposes the default kafka port of ` 9092 `

Create a deployment called ` kafka-broker ` that deploys the most current kafka image and uses the published defaults needed to start.

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [Kafka](https://hub.docker.com/r/wurstmeister/kafka/)

Deployment and service file can be found at /answers/kafka.yaml

</details>

<details>
<summary>Solution</summary>

Inspect the file at /answers/kafka.yaml

```plain 
cat /answers/kafka.yaml
```{{exec}}

Notice that the service is created before the deployment. Notice the labels used ` app: kafka-broker ` this is how the service picks the right pod to use as an endpoint.

Deploy the service and deployment.

```plain
kubectl create -f /answers/kafka.yaml
```{{exec}}

Look at the resources created and wait until the contain becomes ready

```plain
kubectl get all -n kafka
```{{exec}}

Inspect the service and verify that the endpoint is the same as the kafka-broker pod

```plain
kubectl describe svc kafka-service -n kafka
kubectl get pods -o wide -n kafka
```{{exec}}

The pod named kafka-broker-... should have the matching IP to the endpoint of the kafka-service

If all of these values are correct, you're ready to move on to the testing section.

</details>
