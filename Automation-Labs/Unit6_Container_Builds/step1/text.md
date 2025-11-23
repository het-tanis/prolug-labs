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

Run your docker image and test that you are able to see your application.

```plain
docker run -d -p 6000:6000 flask_docker
```{{exec}}

Verify that you are seeing the applicaton

```plain
curl 127.0.0.1:6000
```{{exec}}

Your team also wants to explore building with a tool called apptainer. You want to see a simple apptainer image run, so you decide to build one out. 

Add the repository for apptainer

```plain
add-apt-repository -y ppa:apptainer/ppa
```{{exec}}

Install apptainer
```plain
apt update && apt install -y apptainer apptainer-suid
```{{exec}}

Verfiy your apptainer is installed and on a version you expect.

```plain
apptainer --version
```{{exec}}

Define and build out a apptainer .def file

```plain
cd /root
vi my_image.def
```{{exec}}

Copy in the following lines

```plain
Bootstrap: docker
From: ubuntu:24.04

%post
    apt-get update
    apt-get install -y cowsay
    echo "Hello from inside the container!" > /message.txt

%runscript
    cat /message.txt
    cowsay "Apptainer is awesome!"
```

Build a .sif file for an apptainer image.

```plain
apptainer build my_image.sif my_image.def
```{{exec}}

Rum the image as a container.

```plain
apptainer run my_image.sif
```{{exec}}

Check if this works, or if there is an error. Can you fix the error?

The fix for the error comes from a pathing issue in the cowsay installation. Fix the pathing and rebuild.

```plain
vi my_image.def
```{{exec}}

Copy in the following lines

```plain
Bootstrap: docker
From: ubuntu:24.04

%post
    apt-get update
    apt-get install -y cowsay
    echo "Hello from inside the container!" > /message.txt

%runscript
    cat /message.txt
    /usr/games/cowsay "Apptainer is awesome!"
```

Build a .sif file for an apptainer image. You will have to hit "y" to overwrite the current container.

```plain
apptainer build my_image.sif my_image.def
```{{exec}}

Rum the image as a container.

```plain
apptainer run my_image.sif
```{{exec}}

If this properly prints to the screen, you have fixed your image.

Look around and find some other instances or use cases of apptainer, now that you have a working and installed copy of it on your system.

</details>
