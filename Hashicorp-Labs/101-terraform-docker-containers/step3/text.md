Your team is very impressed that you were able to deploy one container with Terraform and Docker. Now they want you to deploy multiple containers for different ports on the system.

Deploy 3 containers that are bound internally on port 80 and externally use 8080, 8081, and 8082.

<br>

### Tip

<details>
<summary>Tip</summary>

[Terraform Lab Example](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build)

</details>

### Solution
<details>
<summary>Solution</summary>

Let's start by destroying our old Terraform configuration.

```plain
terraform destroy --auto-approve
```{{exec}}

Then let's edit for our new configuration.

```plain
vi main.tf
```

```plain

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx8080" {
  image = docker_image.nginx.latest
  name  = "nginx8080"
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "nginx8081" {
  image = docker_image.nginx.latest
  name  = "nginx8081"
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "nginx8082" {
  image = docker_image.nginx.latest
  name  = "nginx8082"
  ports {
    internal = 80
    external = 8082
  }
}

```

Let's make sure our Terraform configuration is well formatted and validated.

```plain
terraform fmt
terraform validate
```{{exec}}

Let's deploy our resources

```plain
terraform apply --auto-approve
```{{exec}}

Let's verify that all the containers are working.

```plain
docker images
docker ps
curl 127.0.0.1:8080
sleep 2
curl 127.0.0.1:8081
sleep 2
curl 127.0.0.1:8082
```{{exec}}



</details>