kubectl create -f /root/setup/ingress_create.yaml
echo "172.30.1.2 application.lab.mine"  >> /etc/hosts
docker run -d -p 5000:5000 --restart=always --name registry registry:2
mv /root/flask_read_docker/read_requirements.txt /root/flask_read_docker/requirements.txt
mv /root/flask_read_docker/read_Dockerfile /root/flask_read_docker/Dockerfile
mv /root/flask_read_docker/templates/read_index.html /root/flask_read_docker/templates/index.html
touch /tmp/finished