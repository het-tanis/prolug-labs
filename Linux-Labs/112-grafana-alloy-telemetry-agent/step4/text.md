## What you are configuring

This is the core of the lab. **`/etc/alloy/config.alloy`** describes a small **telemetry pipeline** on one Ubuntu host:

```
┌─────────────────────────────────────────────────────────┐
│  Grafana Alloy (this host)                              │
│                                                         │
│  prometheus.exporter.unix  ──►  remote_write ──► Prom   │
│  loki.source.journal       ──┐                          │
│  loki.source.file          ──┴──►  loki.write ──► Loki  │
└─────────────────────────────────────────────────────────┘
```

| Block in config | What it does |
|-----------------|--------------|
| `prometheus.exporter.unix` | Host metrics (CPU, mem, disk, network) |
| `prometheus.remote_write` | Sends metrics to local Prometheus `:9090` |
| `loki.source.journal` | Systemd journal logs |
| `loki.source.file` | `/var/log/syslog` and `/var/log/auth.log` (Ubuntu paths) |
| `loki.write` | Pushes log streams to local Loki `:3100` |

<br>

## Why River / `config.alloy`?

Alloy configs use **River** syntax - blocks wired by `forward_to` and `receiver` references. It looks different from Prometheus scrape YAML or Promtail YAML, but the idea is the same: **sources → processors (optional) → destinations**.

Run **`alloy fmt`** before restart to catch syntax errors early.

<br>

## What to expect after restart

- `systemctl status alloy` should show **active (running)**.
- If the service fails, run `journalctl -u alloy -n 30` - common issues: typo in config, Loki/Prometheus not running, or wrong URL.
- Metrics may take **15-30 seconds** to appear in Prometheus after Alloy starts.

<br>

### Solution
<details>
<summary>Solution - deploy config.alloy and start the pipeline</summary>

**1. Install the lab reference config** from **`/answers`** (see intro) - read it before copying; notice the `forward_to` links:

```plain
cp /answers/config.alloy /etc/alloy/config.alloy
cat /etc/alloy/config.alloy
```{{exec}}

**2. Validate formatting:**

```plain
alloy fmt /etc/alloy/config.alloy
```{{exec}}

**3. Restart Alloy and check status:**

```plain
systemctl restart alloy
systemctl status alloy --no-pager
```{{exec}}

**4. Quick health check in logs and sockets:**

```plain
ss -ntulp | grep alloy
journalctl -u alloy -n 20 --no-pager
```{{exec}}

**Checkpoint:** Alloy is **active** with no repeating crash loop in `journalctl`. Loki and Prometheus from earlier steps must still be running.

</details>
