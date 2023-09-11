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

Check the yaml for you pod definition.

```plain
cat /root/flask_docker/test-app1.yaml
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

Check the file for the ingress controller definition that points to your application.

```plain
cat /root/ingress/app1-ingress.yaml
```{{exec}}

Create the ingress controller that points to your application

```plain
kubectl create -f /root/ingress/app1-ingress.yaml
```{{exec}}

Test that you are able to see your application in action.

```plain
curl application.lab.mine:30080/test
```{{exec}}


Create the mysql portion and populate it with data.

Inspect the mysql deployment and service file

```plain
cat /root/mysql/mysql-deploy.yaml
```{{exec}}

Do you see the correct namespace and application selector for the deployment and service?

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

Now let's load the database with some sample data to read out from our application.

Deploy a pod to use to connect to the mysql database

```plain
kubectl run mysql-client -n data1 --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash
```{{exec}}

You will see that you have dropped into a container bash shell.

Let's put information into the database. Connect like this.

```plain
mysql -h mysql-service -uroot -p'Very$ecure1#'
```{{exec}}

```plain
CREATE DATABASE visitors;
use visitors;
CREATE TABLE persons (personID int, FirstName varchar(255), LastName varchar(255));
INSERT INTO persons VALUES ('1', 'phillip', 'devnull');
INSERT INTO persons VALUES ('2', 'het', 'tanis');
```

Type `exit` to leave the mysql client

Test the read of the table you created.

```plain
mysql -h mysql-service -uroot -p'Very$ecure1#' -e 'use visitors; show tables; select * from persons'
```{{exec}}

Type `exit` to leave the mysql-client pod.

Now it's time to build the read application in flask to read the data from that database.

Move to the right directory

```plain
cd /root/flask_read_docker
```{{exec}}

Check the docker file

```plain
cat /root/flask_read_docker/Dockerfile
```{{exec}}

Check the requirements file for flask and mysql requirements.

```plain
cat /root/flask_read_docker/requirements.txt
```{{exec}}

Check the read application

```plain
cat /root/flask_read_docker/read.py
```{{exec}}

Check the basic index.html to render the test application

```plain
cat /root/flask_read_docker/templates/index.html
```{{exec}}

When you've seen all the files, create the docker image.

```plain
docker image build -t flask_read_docker .
```{{exec}}

Tag and push the image to the local repository

```plain
docker tag flask_read_docker localhost:5000/flask_read_docker
docker push localhost:5000/flask_read_docker
```{{exec}}

Create a simple flask application from your new image

```plain
kubectl create -f /root/flask_read_docker/read-app1.yaml
```{{exec}}

Create the service for read-app1-service

```plain
kubectl expose pod read-app1 --port=6000  --name=read-app1-service -n app1
```{{exec}}

Verify the pods is exposed on port 6000

```plain
kubectl get pods -n app1 -o wide
```{{exec}}

```plain
kubectl describe service read-app1 -n app1
```{{exec}}

Check the file for the ingress controller definition that points to your application.

```plain
cat /root/ingress/complete-app1-ingress.yaml
```{{exec}}

Delete and redeploy the new ingress controller that points to your application

```plain
kubectl delete ingress ingress -n app1
kubectl create -f /root/ingress/complete-app1-ingress.yaml
```{{exec}}

Test that you are able to see your application in action.

```plain
curl application.lab.mine:30080/test
curl application.lab.mine:30080/read
```{{exec}}

This part of the lab is completed and we're ready to move onto securing our application.

</details>

