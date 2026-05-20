## What you are installing

**Grafana Alloy** is Grafana’s unified telemetry agent. One daemon can:

- Collect **host metrics** (replacing Node Exporter for many setups)
- Tail **log files** and read the **systemd journal** (replacing Promtail)
- Later: receive traces, profiles, and more (not in this lab)

Configuration lives in **`/etc/alloy/config.alloy`** - a River language config file, not YAML.

<br>

## Why install the package now but configure later?

The `alloy` package ships a default config so the service *can* start on install. That default will **not** point at your Loki and Prometheus yet.

In this step you only:

1. Install the package from the Grafana repo (already added in step 1)
2. Grant journal access to the `alloy` user
3. Confirm the binary runs (`alloy --version`)

Step 4 replaces `/etc/alloy/config.alloy` with the lab pipeline.

<br>

## Why add `alloy` to the `systemd-journal` group?

On Ubuntu, reading the journal requires membership in **`systemd-journal`**. Without it, Alloy’s `loki.source.journal` block would run but fail to read journal entries - logs would be missing with errors in `journalctl -u alloy`.

<br>

### Solution
<details>
<summary>Solution - install Alloy on Ubuntu</summary>

**1. Install from the Grafana APT repository:**

```plain
apt update
apt install -y alloy
```{{exec}}

**2. Allow journal access:**

```plain
usermod -aG systemd-journal alloy
```{{exec}}

**3. Confirm the binary; enable the unit** (may not be fully healthy until step 4 - that is OK):

```plain
alloy --version
systemctl enable alloy
```{{exec}}

**Checkpoint:** `alloy --version` prints a version string (for example `v1.16.x`). You do **not** need a running pipeline yet.

</details>
