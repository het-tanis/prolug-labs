Your team has decided to use Terraform and deploy containers in an infrastructure as code manner. Verify that containerd is running and that Terraform is installed on your system.

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
mkdir /root/learn-terraform-docker-container
cd /root/learn-terraform-docker-container/
```{{exec}}

Let's do a check around the system to make sure nothing is running in container space.

```plain
docker ps
docker images
```{{exec}}

There are no images downloaded, nor containers deployed on your system.


</details>

