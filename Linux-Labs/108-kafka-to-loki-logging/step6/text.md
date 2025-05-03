Your team has set up Apache Kafka and tested basic functionality. Now you need to set promtail to read the messages going into the topic System_Logs and send them up into loki for storage and later use.

<br>

<details>
<summary>Solution</summary>

Run a loop that generates messages into Kafka

```plain
while true; do random_number=$(( (RANDOM % 10) + 1 )); echo "This is my message at $random_number $(date)" | kcat -P -b node01:31000 -t System_Logs; sleep 3; done
```{{exec}}

Open a new tab at the top of the terminal.

In the new tab, reconfigure promtail to read from Kafka and send messages down into Loki

```plain
cd /opt/promtail
```{{exec}}

vi promtail-local-config.yaml 

```plain
vi promtail-local-config.yaml 
```{{exec}}

Modify the file to pull from kafka topic System_Logs

```plain
- job_name: kafka
  kafka:
    brokers:
    - node01:31000
    topics:
    - System_Logs
    labels:
      job: kafka
```

Save by using ":wq" or "Shift + ZZ"

Restart Promtail

```plain
systemctl restart promtail
```{{exec}}

Go back over to your Grafana Loki dashboard.

Refresh the page and verify that the app drop down has Kafka and watch Promtail pull your messages from Kafka and write into Loki.

</details>