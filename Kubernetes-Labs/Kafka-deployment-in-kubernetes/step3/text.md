You've done the research and setup the environment. Now it's time to test you can put messages to a broker and consume them. There is a tool called kafkacat that you can use to test it from the command line.

Install kafkacat 

Put a message to the broker on the external NodePort

Pull a message from the broker on the external Nodeport

<br>

<details>
<summary>Tip</summary>

Relevant Documentation [kafkacat](https://dev.to/de_maric/learn-how-to-use-kafkacat-the-most-versatile-kafka-cli-client-1kb4)

</details>

<details>
<summary>Solution</summary>

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

This will work for now, we could clean up our /etc/hosts file later if we wanted.

Send a message into kafka with kafkacat

```plain
echo "This is my message at $(date)" | kafkacat -P -b node01:31000 -t test
```{{exec}}

Now we consume that message from kafka. 

```plain
timeout 3 kafkacat -C -b node01:31000 -t test
```{{exec}}

If this works, you can continue to use whatever other tool you may want to work with. For now your team has a funcioning Kafka broker and can start to work on event driven architecture in your environment.

</details>