ssh node01 'systemctl stop kubelet'
ssh node01 'systemctl disable kubelet'

sleep 30

touch /tmp/finished