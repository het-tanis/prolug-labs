# example of usage grafana/loki api when you need push any log/message from your pyth
import requests
import json
import datetime
import pytz

host = 'controlplane'
curr_datetime = datetime.datetime.now(pytz.timezone('Asia/Yekaterinburg'))
curr_datetime = curr_datetime.isoformat('T')
msg = 'On server {host} detected error scott is too awesome'.format(host=host)

# push msg log into grafana-loki
url = 'http://127.0.0.1:3100/api/prom/push'
headers = {
    'Content-type': 'application/json'
}
payload = {
    'streams': [
        {
            'labels': '{source=\"Testing\",job=\"lab_logging\", host=\"' + host + '\"}',
            'entries': [
                {
                    'ts': curr_datetime,
                    'line': '[FORSTREAM] ' + msg
                }
            ]
        }
    ]
}
payload = json.dumps(payload)
answer = requests.post(url, data=payload, headers=headers)
print(answer)
response = answer
print(response)
# end pushing