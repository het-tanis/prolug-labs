In your reseach you find that Telegraf can write out to InfluxDB2. So you need to install and configure telegraf to write telemetry data into influxDB2.

Install Telegraf.

Configure Telegraf to push data into InfluxDB2.

Verify that telegraf is running and pushing data into InfluxDB2

<br>

### Solution
<details>
<summary>Solution</summary>

Install the respository for telegraf.

```plain
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | tee /etc/apt/sources.list.d/influxdata.list
```{{exec}}

Install telegraf

```plain
apt update && apt -y install telegraf
```{{exec}}

Setup the telegraf configuration file to write to the output producer for influxdb2

```plain
vi /etc/telegraf/telegraf.conf
```{{exec}}

Set the information as follows: (Replace with your url, token, organization, and bucket)
```plain
###############################################################################
#                            OUTPUT PLUGINS                                   #
###############################################################################


# # Configuration for sending metrics to InfluxDB 2.0
 [[outputs.influxdb_v2]]
#   ## The URLs of the InfluxDB cluster nodes.
#   ##
#   ## Multiple URLs can be specified for a single cluster, only ONE of the
#   ## urls will be written to each interval.
#   ##   ex: urls = ["https://us-west-2-1.aws.cloud2.influxdata.com"]
   urls = ["http://127.0.0.1:8086"]
#
#   ## Token for authentication.
   token = "mXA4HiqkssvKaNMtGmEyGPa7h8bpV7hwgjqRJKtBz79qpbQSbIzsaClRJgyuIhBxyw5Lb8qF2Jt1yy_-2qUTA=="
#
#   ## Organization is the name of the organization you wish to write to.
   organization = "influxtest"
#
#   ## Destination bucket to write into.
   bucket = "influxdata"
```

Restart Telegraf and verify it's writing to InfluxDB2

```plain
systemctl restart telegraf
systemctl status telegraf --no-pager -l
```{{exec}}

Look at the output above and verify that telegraf is properly writing out to InfluxDB2.

</details>