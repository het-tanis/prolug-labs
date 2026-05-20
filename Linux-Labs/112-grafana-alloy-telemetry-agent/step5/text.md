## What you are verifying

Installing services is only half the story. This step proves the **full path** works:

1. Alloy collected data on the Ubuntu host  
2. Prometheus and Loki stored it  
3. Grafana can query both backends  

If any link in that chain is broken, Explore will show empty results even when `systemctl` says services are fine.

<br>

## Grafana data sources - what to add

| Data source | URL | Stores |
|-------------|-----|--------|
| Prometheus | `http://127.0.0.1:9090` | Metrics from Alloy remote write |
| Loki | `http://127.0.0.1:3100` | Logs from Alloy |

You only configure these once per Grafana instance. **Save & test** should report success for each.

<br>

## Example queries to try

**Metrics (Prometheus data source):**

- `up` - general health signals  
- `node_cpu_seconds_total` - CPU metrics from Alloy’s unix exporter (names may vary slightly by version)

**Logs (Loki data source):**

- `{job=~"syslog|auth|systemd-journal"}` - streams defined in your `config.alloy`

After running `logger "alloy-lab-test-message"`, filter or search for `alloy-lab-test` in Explore.

<br>

### Solution
<details>
<summary>Solution - wire Grafana and confirm telemetry</summary>

**1. Open Grafana:**

{{TRAFFIC_HOST1_3000}}

**2. Add Prometheus:** Menu → **Connections** → **Data sources** → **Add data source** → **Prometheus**  
- URL: `http://127.0.0.1:9090`  
- **Save & test** → should show green success  

**3. Add Loki:** **Add data source** → **Loki**  
- URL: `http://127.0.0.1:3100`  
- **Save & test** → should show green success  

**4. Explore metrics:** **Explore** → select **Prometheus** → run:

```promql
up
```

Try `node_cpu_seconds_total` if `up` returns data.

**5. Explore logs:** **Explore** → select **Loki** → run:

```logql
{job=~"syslog|auth|systemd-journal"}
```

**6. Generate a test log line on Ubuntu:**

```plain
logger "alloy-lab-test-message"
```{{exec}}

Refresh the Loki query within about a minute - you should see the test message (often under syslog or journal labels).

**Optional:** Import dashboard ID **13639** (community syslog dashboard) for a pre-built log view.

**Checkpoint:** At least one metric series and log lines visible in Explore. If not, verify all three services: `systemctl is-active grafana-server loki prometheus alloy`.

</details>
