You've setup all the pieces, now you have to create a dashboard in Grafana and verify that everything is working end to end.

Log into Grafana (and change the password if you didn't do it earlier)

Create the datasource for Prometheus in the the Datasource page. URL = http://127.0.0.1:9090

Create a dashboard (import 159) that shows the telemetry information for your server.

<br>

### Solution
<details>
<summary>Solution</summary>

Connect to Grafana and log in {{TRAFFIC_HOST1_3000}}

Create the datasource for Prometheus in the the Datasource page. URL = http://127.0.0.1:9090 

Import the dashboard 159 to view the metric data.

Verify the dashboard is working properly.

</details>
