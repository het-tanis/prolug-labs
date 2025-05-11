You must have a Discord webhook for this part to work. Running a discord server is free, or if you're part of ProLUG, there are webhooks available for use in the server.

Setup the Grafana alerting to Discord.

Under Alerting: Create contact point for Discord

Set name: Discord
Integration: Discord
Webhook: Collect from your discord channel or ProLUG Discord.
Test to Discord -> It will write in the ProLUG Sandbox channel if you use that webhook from the lab.
"Save contact point"

Under Alerting: Alert Rules create a New Rule Alert
Section 1: Name: Discord test
Section 2: Query: from Influxdb
Enter condition from dashboard above

```plain
from(bucket: "test")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "fail2ban")
  |> filter(fn: (r) => r["jail"] == "sshd")
  |> filter(fn: (r) => r["_field"] == "banned")
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")
```

Alert condition is when last is above 0 - You will see that it is currently firing, if you have a jailed user from first lab section.

Section 3: Set a new folder to Alerts
Section 4: Set evaluation behavior Name to Alert

Section 5: set contact point to Discord.
Section 6: Set summary to your name and fail2ban jail set

Hit save rule and exit in top right

Verify that the lab triggers the alert into Discord. If the alert is not firirg, go back to step 1 and ensure that you have node01 in sshd jail, by repeating the login attempts to failure. 






