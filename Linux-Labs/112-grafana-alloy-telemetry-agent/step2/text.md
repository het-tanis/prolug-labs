## What you are building

**Prometheus** is a time-series database for **metrics** (CPU, memory, disk, and so on). In older labs you might have installed **Node Exporter** and let Prometheus *scrape* it.

This lab uses a different pattern:

```
Alloy (on this host)  --remote write-->  Prometheus (stores metrics)
```

Alloy runs a built-in **unix exporter** (similar data to Node Exporter) and **pushes** samples to Prometheus. Prometheus must accept those pushes.

<br>

## Why enable the remote-write receiver?

By default Prometheus only **pulls** metrics from scrape targets. Alloy **pushes** via HTTP to:

`http://127.0.0.1:9090/api/v1/write`

The flag **`--web.enable-remote-write-receiver`** on the Prometheus service turns that endpoint on. Without it, Alloy’s metric pipeline would fail silently or error in the Alloy logs.

<br>

## What to expect

- Prometheus listens on **9090**.
- The bundled `prometheus.yml` only scrapes Prometheus itself for this lab - that is fine. Host metrics will arrive via Alloy remote write, not scrape configs.
- You are not installing Node Exporter in this lab.

<br>

### Solution
<details>
<summary>Solution - install Prometheus with remote write enabled</summary>

**1. Create a dedicated user and directories** (Prometheus should not run as root):

```plain
useradd --no-create-home prometheus 2>/dev/null || true
mkdir -p /var/lib/prometheus /etc/prometheus
```{{exec}}

**2. Download and install the Prometheus binary:**

```plain
wget -q https://github.com/prometheus/prometheus/releases/download/v2.42.0-rc.0/prometheus-2.42.0-rc.0.linux-amd64.tar.gz -P /tmp
tar xzf /tmp/prometheus-2.42.0-rc.0.linux-amd64.tar.gz -C /tmp
cp /tmp/prometheus-2.42.0-rc.0.linux-amd64/prometheus /usr/bin/prometheus
chown -R prometheus:prometheus /var/lib/prometheus
```{{exec}}

**3. Install lab config and systemd unit** - copy from **`/answers`** into `/etc` (see intro; files were staged when the scenario started):

Look at the service file - confirm you see **`--web.enable-remote-write-receiver`**:

```plain
cp /answers/prometheus.yml /etc/prometheus/prometheus.yml
cp /answers/prometheus.service /etc/systemd/system/prometheus.service
cat /etc/systemd/system/prometheus.service
```{{exec}}

**4. Start Prometheus:**

```plain
systemctl daemon-reload
systemctl enable prometheus --now
systemctl status prometheus --no-pager
ss -ntulp | grep 9090
```{{exec}}

**Checkpoint:** `prometheus` service is **active** and port **9090** is listening. You can also visit `http://127.0.0.1:9090` in the lab environment and see the Prometheus UI (optional).

</details>
