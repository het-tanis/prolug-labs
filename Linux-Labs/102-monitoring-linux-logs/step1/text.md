Your team has determined they need to offload and monitor Linux logs in your environment. You know that Grafana can do that as a visualization tool, so you plan to deploy it on a server as a daemon.

Deploy Grafana and ensure that it is running on your server.

<br>

### Solution
<details>
<summary>Solution</summary>

Install the requred Grafana packages.

```plain
apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_9.3.2_amd64.deb
dpkg -i grafana-enterprise_9.3.2_amd64.deb
```{{exec}}

Now that you've installed Grafana, let's make sure it's started.

```plain
systemctl daemon-reload
systemctl enable grafana-server --now
```{{exec}}

Verify that the server is serving on port 3000 (the default port)

```plain
systemctl status grafana-server
ss -ntulp | grep grafana
ss -ntulp | grep 3000
```{{exec}}

We can also check the external Web UI is available and change the default password.

{{TRAFFIC_HOST1_3000}}

Change the password. Default User: admin and Password: admin

Feel free to look around in the Web UI and then continue on to the next part of the lab.

</details>