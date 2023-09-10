Now you're ready to setup the application and data portions of your three tier app.

Create the Flask application and expose it via an ingress controller. 

Create the mysql database and load it with sample data.

Test the ingress connection to your application.

Test the basic application functionality to the database.


<br>
<details>
<summary>Solution</summary>
Create the flask docker container image for our application.

Move to the right directory

```plain
cd /root/flask_docker
```{{exec}}

Check the docker file

```plain
cat /root/flask_docker/Dockerfile
```{{exec}}

Check the requirements file for flask and mysql requirements.

```plain
cat /root/flask_docker/requirements.txt
```{{exec}}

Check the sample flask application

```plain
cat /root/flask_docker/view.py
```{{exec}}

Check the basic index.html to render the test application

```plain
cat /root/flask_docker/templates/index.html
```{{exec}}

When you've seen all the files, create the docker image.

```plain
docker image build -t flask_docker .
```{{exec}}

Tag and push the image to the local repository

```plain
docker tag flask_docker localhost:5000/flask_docker
docker push localhost:5000/flask_docker
```{{exec}}

Create a simple flask application from your new image

```plain
kubectl create -f /root/flask_docker/test-app1.yaml
```{{exec}}

Create the service for test-app1-service

```plain
kubectl expose pod test-app1 --port=6000  --name=test-app1-service -n app1
```{{exec}}

Verify the pods is exposed on port 6000

```plain
kubectl get pods -n app1 -o wide
```{{exec}}

```plain
kubectl describe service test-app1 -n app1
```{{exec}}

Create the ingress controller that points to your application

```plain
cat /root/ingress/app1-ingress.yaml
```{{exec}}

```plain
kubectl create -f /root/ingress/app1-ingress.yaml
```{{exec}}

Create the mysql portion and populate it with data.

Deploy the service file provided.
```plain
kubectl create -f /root/mysql/mysql-deploy.yaml
```{{exec}}

Inspect the resources that were created

```plain
kubectl get svc -n data1
kubectl describe svc mysql-service -n data1
```{{exec}}

You may have to wait ~15 seconds for the container to create

```plain
kubectl get deployments -n data1
kubectl get pods -o wide -n data1 --show-labels
```{{exec}}




</details>

