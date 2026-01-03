
This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your development teams have decided to use containers. You want to familiarize yourself with rapidly deploying environments of those containers. You have decided to look into ensuring that automation supports the different tasks they will need your team to complete.

<br>

### Tip

<details>
<summary>Tip</summary>

[Terraform Lab Example](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build)

</details>

### Solution
<details>
<summary>Solution</summary>

Check that containerd is running and exposed on your system

```plain
systemctl status containerd --no-pager
ss -ntulp | grep -i containerd
```{{exec}}

So containerd is running. Can you check that terraform is installed?

```plain
which terraform
terraform version
```{{exec}}

What version of terraform are you running?

Let's make a directory for this project.

```plain
mkdir /root/terraform
cd /root/terraform/
```{{exec}}

Let's do a check around the system to make sure nothing is running in container space.

```plain
docker ps
docker images
```{{exec}}

There are no images downloaded, nor containers deployed on your system.


</details>

