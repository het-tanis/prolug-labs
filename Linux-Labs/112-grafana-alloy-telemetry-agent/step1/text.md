## What you are building

Before Alloy can send anything anywhere, you need **places for data to land** and **a UI to explore it**.

| Component | Role in this lab |
|-----------|------------------|
| **Grafana** | Web UI on port **3000** - dashboards and Explore |
| **Loki** | Log storage on port **3100** - Alloy will push logs here in step 4 |

Think of this step as laying the foundation: visualization (Grafana) and log storage (Loki). Metrics storage (Prometheus) comes in step 2; the collector (Alloy) in steps 3-4.

<br>

## Why Grafana’s APT repository?

**Grafana** and **Alloy** (later) both ship from Grafana’s official package repo. Configuring that repository once on Ubuntu keeps versions aligned and avoids hunting for random `.deb` downloads.

**Loki** here is installed as a standalone binary under `/opt/loki` - a common lab pattern that matches earlier observability exercises and keeps Loki independent of the Alloy package.

<br>

## What to expect

- Grafana will prompt you to change the default `admin` password the first time you open the UI.
- Loki will listen on **3100**; you will not query Loki from the shell much - Grafana and Alloy talk to it over HTTP.
- Nothing sends logs to Loki yet; that is normal until Alloy is configured.

<br>

### Solution
<details>
<summary>Solution - install Grafana and Loki on Ubuntu</summary>

**1. Add the Grafana APT repository** (packages are signed; we import the key first):

```plain
apt install -y apt-transport-https software-properties-common wget
```{{exec}}

```plain
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
```{{exec}}

```plain
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee /etc/apt/sources.list.d/grafana.list
```{{exec}}

**2. Install and start Grafana:**

```plain
apt update
apt install -y grafana
```{{exec}}

```plain
systemctl daemon-reload
systemctl enable grafana-server --now
systemctl status grafana-server --no-pager
ss -ntulp | grep 3000
```{{exec}}

Open Grafana in the browser (port **3000**). Sign in with `admin` / `admin` and set a new password when asked.

{{TRAFFIC_HOST1_3000}}

**3. Install Loki** - binary under `/opt/loki`; copy lab configs from **`/answers`** (see intro - pre-staged reference files):

```plain
mkdir -p /opt/loki
cd /opt/loki
```{{exec}}

```plain
curl -O -L "https://github.com/grafana/loki/releases/download/v2.9.7/loki-linux-amd64.zip"
unzip -o loki-linux-amd64.zip
chmod a+x loki-linux-amd64
```{{exec}}

```plain
cp /answers/loki-local-config.yaml /opt/loki/
cp /answers/loki.service /etc/systemd/system/loki.service
systemctl daemon-reload
systemctl enable loki.service --now
systemctl status loki.service --no-pager
ss -ntulp | grep 3100
```{{exec}}

**Checkpoint:** Both `grafana-server` and `loki.service` should be **active**. Port **3000** (Grafana) and **3100** (Loki) should appear in `ss` output.

</details>
