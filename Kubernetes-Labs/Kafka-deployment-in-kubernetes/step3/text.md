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

Send a message into kafka with kafkacat

```plain
echo "This is my first message" | kafkacat -P -b node01:31000 -t test
```{{exec}}

Now we consume that message from kafka. 

```plain
kafkacat -C -b node01:31000 -t test
```{{exec}}

If this works, you can continue to use whatever other tool you may want to work with. For now your team has a funcioning Kafka broker and can start to work on event driven architecture in your environment.

</details>