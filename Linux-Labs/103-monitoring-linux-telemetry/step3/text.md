In your reseach you find that the Prometheus can read telemetry data from Node Exporter. Your tasks will be to deploy and configure Prometheus to poll telemetry data from Node Exporter.

Install Prometheus.

Configure Prometheus to gather telemetry data.

Ensure that Prometheus is running correctly.

<br>

### Solution
<details>
<summary>Solution</summary>

Setup your server for Prometheus install

```plain
useradd prometheus
```{{exec}}

```plain
mkdir /var/lib/prometheus
```{{exec}}

Download and extract Prometheus and required tools.

```plain
wget https://github.com/prometheus/prometheus/releases/download/v2.42.0-rc.0/prometheus-2.42.0-rc.0.linux-amd64.tar.gz  -P /tmp
tar xvfz /tmp/prometheus-2.42.0-rc.0.linux-amd64.tar.gz -C /var/lib/prometheus/ --strip-components=1
cp /var/lib/prometheus/prometheus /usr/bin/prometheus
```{{exec}}

Change ownership of /var/lib/prometheus so that prometheus user can start the service

```plain
chown -R prometheus:prometheus /var/lib/prometheus/
```{{exec}}

Create a directory and copy over the configuration for prometheus

```plain
mkdir /etc/prometheus
cp /answers/prometheus.yml /etc/prometheus/prometheus.yml
```{{exec}}

View the file and look at the configuration

```plain
cat /etc/prometheus/prometheus.yml
```{{exec}}

Copy over the prometheus.service file so that systemd can control and start prometheus

```plain
cp /answers/prometheus.service /etc/systemd/system/prometheus.service
```{{exec}}

View the file and look at the configuration

```plain
cat /etc/systemd/system/prometheus.service
```{{exec}}

Start the Prometheus Service

```plain
systemctl daemon-reload
systemctl start prometheus
```{{exec}}

Verify that Prometheus is working

```plain
systemctl status prometheus.service --no-pager
ps -ef | grep [p]rometheus
```{{exec}}

You can also access prometheus via this link:

{{TRAFFIC_HOST1_9090}}

</details>