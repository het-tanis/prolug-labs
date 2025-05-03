Your team is integrating Kafka with an existing Loki infrastructure for passing log messages. Your task is to stand up Kafka in a kubernetes cluster. For more information about the steps provided, view the kafka lab [here](https://killercoda.com/het-tanis/course/Kubernetes-Labs/Kafka-deployment-in-kubernetes)


<br>

<details>
<summary>Tip</summary>

Answers file can be found at /answers

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

Create zookeeper deployment and services

```plain
kubectl create -f /answers/zookeeper.yaml
```{{exec}}

Verify that everything is working properly

```plain
kubectl get all -n kafka
```{{exec}}

Wait 60 seconds and run that command a few times to see that zookeeper is started. Descibe the services and pods to see their details.

```plain
kubectl describe -n kafka svc zookeeper-service
```{{exec}}

Next we deploy Kafka

Deploy the service and deployment.

```plain
kubectl create -f /answers/kafka.yaml
```{{exec}}

Wait 30 seconds and then verify that the service is pointed to the pod IP address as an endpoint.

```plain
kubectl describe svc kafka-service -n kafka
kubectl get pods -o wide -n kafka
```{{exec}}

The pod named kafka-broker-... should have the matching IP to the endpoint of the kafka-service

Install kafkacat tool

```plain
apt -y install kafkacat
```{{exec}}

For the communication to work, we have just one last thing to do, modify our /etc/hosts and make sure the port is forwarded from localhost to port 9092.

```plain
kubectl port-forward $(kubectl get pods -n kafka | grep kafka | awk '{print $1}') 9092 -n kafka &
echo "127.0.0.1 localhost kafka-broker" >> /etc/hosts
```{{exec}}

Hit enter after this command.

Send a message into kafka with kcat

```plain
echo "This is my message at $(date)" | kcat -P -b node01:31000 -t System_Logs
```{{exec}}

Now we consume that message from kafka. 

```plain
timeout 3 kcat -C -b node01:31000 -t System_Logs
```{{exec}}


</details>