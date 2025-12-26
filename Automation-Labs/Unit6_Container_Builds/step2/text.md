### Lab Activities

Your team has decided to use Hashicorp Packer as a tool for accurately building and pushing images in your environment. You have decided to use it to push your simple flask app, and test the capabilities of putting it into a CI/CD pipeline.

Build the same container that you did with docker in step 1, but with the name packer prepended to it.

<br>
<details>
<summary>Solution</summary>

Build a basic Packer file

```plain
mkdir /root/packer
cd /root/packer
```{{exec}}

Make the docker-flask.pkr.hcl file

```plain
vi docker-flask.pkr.hcl
```{{exec}}

Press "i" and add the following lines

```plain
packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "python:3.9-alpine"
}

source "docker" "flask" {
  image  = var.docker_image
  commit = true
  changes = [
    "CMD view.py",
    "ENTRYPOINT python",
    "WORKDIR /app",
    "EXPOSE 6000"
  ]
}

build {
  name    = "packer-flask"
  sources = [
    "source.docker.flask",
  ]

  post-processor "docker-tag" {
    repository = "packer-flask"
    tags       = ["packer-flask"]
    only       = ["docker.flask"]
  }

}

```

Pull the needed plugins, as Packer doesn't have all plugins loaded on install.

```plain
packer init .
```{{exec}}

Build the container image with Packer

```plain
packer build .
```{{exec}}

Verify that we have the image in docker images.

```plain
docker images
```{{exec}}

Add the shell and file provisioners to move the code into the flask container. (This goes into the build section of the previous docker-flask.pkr.hcl files)

```plain
vi docker-flask.pkr.hcl
```{{exec}}

```plain
packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "python:3.9-alpine"
}

source "docker" "flask" {
  image  = var.docker_image
  commit = true
  changes = [
    "CMD view.py",
    "ENTRYPOINT python",
    "WORKDIR /app",
    "EXPOSE 6000"
  ]
}

build {
  name    = "packer-flask"
  sources = [
    "source.docker.flask",
  ]

  provisioner "shell" {
    inline = ["mkdir /app"]
  }

  provisioner "file" {
    source      = "/root/docker/templates/index.html"
    destination = "/app/index.html"
  }

  provisioner "file" {
    source      = "/root/docker/view.py"
    destination = "/app/view.py"
  }

  provisioner "file" {
    source      = "/root/docker/requirements.txt"
    destination = "/app/requirements.txt"
  }
  
  provisioner "shell" {
    inline = [
      "pip3 install -r /app/requirements.txt"
    ]
  }

  post-processor "docker-tag" {
    repository = "packer-flask"
    tags       = ["packer-flask"]
    only       = ["docker.flask"]
  }

}

```




</details>