kubectl create -f /root/setup/ingress_create.yaml

echo "172.30.1.2 application.lab.mine"  >> /etc/hosts

docker run -d -p 5000:5000 --restart=always --name registry registry:2

touch /tmp/finished