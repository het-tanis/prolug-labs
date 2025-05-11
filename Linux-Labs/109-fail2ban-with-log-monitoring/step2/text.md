Install Grafana and Loki on the system.

<br>

### Solution
<details>
<summary>Solution</summary>

Install the required packages and Grafana GPG key.

```plain
apt install -y apt-transport-https
```{{exec}}

```plain
apt install -y software-properties-common wget
```{{exec}}

```plain
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
```{{exec}}

Add the Grafana repository.
  
```plain
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```{{exec}}
  
Finally, we're ready to install Grafana:
  
```plain
apt update
# Install the latest Enterprise release:
apt install -y grafana-enterprise
```{{exec}}

Now that you've installed Grafana, let's make sure it's started.

```plain
systemctl daemon-reload
```{{exec}}

```plain
systemctl start grafana-server
```{{exec}}

```plain
systemctl status grafana-server --no-pager
```{{exec}}

Verify that the server is serving on port 3000 (the default port). This may take up to 10 seconds to come back with the correct listening port.

```plain
systemctl status grafana-server --no-pager
ss -ntulp | grep grafana
ss -ntulp | grep 3000
```{{exec}}

We can also check that the external Web UI is available and change the default password.

{{TRAFFIC_HOST1_3000}}

Change the password. Default User: admin and Password: admin

Feel free to look around in the Web UI and then continue on to the next part of the lab.

Next install Loki.

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