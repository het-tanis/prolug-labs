Setup the Influxdb connection in Grafana

You've setup all the pieces, now you have to create a dashboard in Grafana and verify that everything is working end to end.

Connect to Grafana and log in {{TRAFFIC_HOST1_3000}}

Log into Grafana (and change the password if you didn't do it earlier)

Create the datasource for InfluxDB2 in the the Datasource page. 

Query Language: Flux

URL = http://127.0.0.1:8086

You also need to know all of your client token, organization, and bucket information.

If you see "Datasource is working: 3 Buckets found" You know you connected properly.

Create a new Dashboard.
Select Add Visualization
Pick the data source InfluxDB.
Name your Panel Fail2ban Jails

Set this as your query:

```plain
from(bucket: "test")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "fail2ban")
  |> filter(fn: (r) => r["jail"] == "sshd")
  |> filter(fn: (r) => r["_field"] == "banned")
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")
```

Verify the dashboard is working properly.

You will either see the jail for sshd set at 0 or 1, depending on how you left step 1 of the lab. If you did not play around with it, it will show 0.

Save the dashboard and call it Fail2ban_monitor.


