Install node_exporter and prometheus on the system.

<br>

### Solution
<details>
<summary>Solution</summary>

Create the directory where we will install Node Exporter.

```plain
mkdir /opt/node_exporter
```{{exec}}

`cd` into that directory to set up the server.

```plain
cd /opt/node_exporter
```{{exec}}

Download and unpackage a current version of Node Exporter and move to the extracted folder.

```plain
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
```{{exec}}


```plain
cp /answers/node_exporter.service /etc/systemd/system/node_exporter.service
```{{exec}}


Review the service file so that you are confident it is going to properly start Node Exporter.

```plain
cat /etc/systemd/system/node_exporter.service
```{{exec}}

Now that you've checked everything reload the systemd configuration manager and start Node Exporter daemon.

```plain
systemctl daemon-reload
systemctl enable node_exporter.service --now
```{{exec}}

Verify that Node Exporter is running and exposing the proper port.

```plain
systemctl status node_exporter --no-pager
sleep 2
curl http://localhost:9100/metrics
```{{exec}}

What data can you see exposed? Don't worry if it's not well formatted for you to process, it's in the correct configuration for Prometheus to scrape.

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