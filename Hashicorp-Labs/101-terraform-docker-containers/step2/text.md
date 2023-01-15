Let's create the first deployment of Terraform in our environment.

Create a Terraform configuration for running nginx on port 8000 on your system.

Verify that you can see the running container.

View your  terraform.tfstate file to see what Terraform tracks in a configuration deployment.


<br>

### Tip

<details>
<summary>Tip</summary>

[Terraform Lab Example](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build)

</details>

### Solution
<details>
<summary>Solution</summary>

Let's start by creating a Terraform configuration.

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

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

```

Let's make sure our Terraform configuration is well formatted and validated.

```plain
terraform fmt
terraform validate
```{{exec}}

We will see an error here. This is because the validate is looking to see if we're done an init and pulled down the provider. That is happening in the next step.

Before we can deploy with Terraform we need to initialize and download all providers.

```plain
terraform init
```{{exec}}

Let's check the system to see all the files that have been created

```plain
ls -al
```{{exec}}

Let's deploy our resources

```plain
terraform apply --auto-approve
```{{exec}}

Let's verify that we have a working container

```plain
docker images
docker ps
curl 127.0.0.1:8000
```{{exec}}

Look at the terraform.tfstate file to see all the objects that terraform is tracking in the deployment.

```plain
cat terraform.tfstate
```{{exec}}

WARNING: The terraform.tfstate file should never be edited by hand, only terraform should edit that file.


</details>