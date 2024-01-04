
import influxdb_client, os, time
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

token = "22g5g2Q7NrBal5bk5bCkXvOaKxjD5yRZATsLjwJP9PLXPBMhb18uuBmnyiNoecIC298z9otapEffBJQdVluRwA=="
org = "lab"
url = "http://127.0.0.1:8086"

client = influxdb_client.InfluxDBClient(url=url, token=token, org=org)

#Write data

bucket="test"

write_api = client.write_api(write_options=SYNCHRONOUS)

for value in range(10):
  point = (
    Point("measurementscott")
    .tag("tagname1", "tagvalue1")
    .field("field1", value)
  )
  write_api.write(bucket=bucket, org="lab", record=point)
  time.sleep(1) # separate points by 1 second