### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your development teams have decided to build their own container images. You have decided to work on different container image tools to practice modifying containers that are publicly available. Your goal is to modify them with your own requirements list of additional software and also your custom application code.

Use Docker to build a ready container for your environment.

User apptainer to build a ready container for your environment.

Ensure you have the Ansible module for kubernetes core.

<br>
<details>
<summary>Solution</summary>

Build an image for your environment.

Move to the right directory

```plain
cd /root/docker
```{{exec}}

Check the docker file

```plain
cat /root/docker/Dockerfile
```{{exec}}

Check the requirements file for flask and mysql requirements.

```plain
cat /root/docker/requirements.txt
```{{exec}}

Check the sample flask application

```plain
cat /root/docker/view.py
```{{exec}}

Check the basic index.html to render the test application

```plain
cat /root/docker/templates/index.html
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




Now, think about all the ways that variables can be passed into Ansible. Where else might you get these variables passed in as you create these environments? What other ways can teams present variables to your automations?

</details>
