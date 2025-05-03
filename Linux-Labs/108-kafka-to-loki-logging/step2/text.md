Your team has decided the log aggregator will be a tool called Loki. Your job is to get Loki up and running on your server.

Install Loki.

Verify Loki is running and exposing port 3100.

<br>

### Solution
<details>
<summary>Solution</summary>
Create the directory where we will install Loki

```plain
mkdir /opt/loki
```{{exec}}

cd into that directory to set up the server

```plain
cd /opt/loki
```{{exec}}

Download and unpackage a current version of Loki

```plain
curl -O -L "https://github.com/grafana/loki/releases/download/v2.9.7/loki-linux-amd64.zip"
unzip "loki-linux-amd64.zip"
chmod a+x "loki-linux-amd64"

```{{exec}}

Copy over the loki config file from the /answers directory

```plain
cp /answers/loki-local-config.yaml /opt/loki
```{{exec}}

Copy over the loki.service file and restart the systemctl daemon so that Loki can run on your system.

```plain
cp /answers/loki.service /etc/systemd/system/loki.service
systemctl daemon-reload
```{{exec}}

Review the config file for Loki before starting the server.

```plain
cat /opt/loki/loki-local-config.yaml
```{{exec}}

Review the service file so that you are confident it is going to properly start Loki.

```plain
cat /etc/systemd/system/loki.service
```{{exec}}

Now that you've checked everything, start Loki daemon.

```plain
systemctl enable loki.service --now
```{{exec}}

Verify that Loki is running and exposing the proper port.

```plain
systemctl status loki.service --no-pager
ss -ntulp | grep 3100
```{{exec}}

</details>