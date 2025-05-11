In your reseach you find that the Promtail tool can push logs over to Loki in real time. Your tasks will be to deploy and configure Promtail to push logs into loki server.

Install Promtail.

Configure Promtail to push /var/log/auth.log and /var/log/syslog off the server to the Loki aggregator.

Ensure that Promtail is running correctly.

<br>

### Solution
<details>
<summary>Solution</summary>

Create the directory where we will install Promtail.

```plain
mkdir /opt/promtail
```{{exec}}

Change to that directory and get ready to install promtail

```plain
cd /opt/promtail
```{{exec}}

Download and extract the executable

```plain
curl -O -L "https://github.com/grafana/loki/releases/download/v2.7.1/promtail-linux-amd64.zip"
unzip promtail-linux-amd64.zip 
```{{exec}}

Copy over the provided configuration and verify that it is pointing to the correct log files that you want to review.

```plain
cp /answers/promtail-local-config.yaml /opt/promtail
cat /opt/promtail/promtail-local-config.yaml
```{{exec}}

What do you notice about the configuration file? What are the scrape configs? What is the format that the file is in?

Setup the Promtail service configuration file for systemd to use to start the service

```plain
cp /answers/promtail.service /etc/systemd/system/promtail.service
cat /etc/systemd/system/promtail.service
```{{exec}}

Reload the systemd daemon and start the Promtail service

```plain
systemctl daemon-reload
systemctl enable promtail.service --now
```{{exec}}

Verify that the Promtail service is running on your system.

```plain
systemctl status promtail.service --no-pager
ps -ef | grep [p]romtail
```{{exec}}

</details>