Your team has decided that the data for Prometheus will be exposed via the tool Node Exporter. Your jobs is to get Node Exporter up and running on your server.

Install Node Exporter.

Verify Node Exporter is running and exposing port 9100.

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

Download and unpackage a current version of Node Exporter.

```plain
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
```{{exec}}

Copy over the node_exporter.service file and restart the systemctl daemon so that Node Exporter can run on your system.

```plain
cp /answers/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
```{{exec}}


Review the service file so that you are confident it is going to properly start Node Exporter.

```plain
cat /etc/systemd/system/node_exporter.service
```{{exec}}

Now that you've checked everything, start Node Exporter daemon.

```plain
systemctl enable node_exporter.service --now
```{{exec}}

Verify that Node Exporter is running and exposing the proper port.

```plain
systemctl status node_exporter --no-pager
sleep 2
curl http://localhost:9100/metrics
```{{exec}}

</details>