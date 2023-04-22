You've setup all the pieces, now you have to create a dashboard in Grafana and verify that everything is working end to end.

Log into Grafana (and change the password if you didn't do it earlier)

Create the datasource for InfluxDB2 in the the Datasource page. URL = http://127.0.0.1:8086
You also need to know all of your client token, organization, and bucket information.

Create a dashboard that shows the telemetry information for your server from InfluxDB2.

<br>

### Solution
<details>
<summary>Solution</summary>

Connect to Grafana and log in {{TRAFFIC_HOST1_3000}}

Create the datasource for InfluxDB2 in the the Datasource page. URL = http://127.0.0.1:8086

Create the dashboard.

Verify the dashboard is working properly.

</details>
