### Lab Activities

Your team has decided to use Hashicorp Packer as a tool for accurately building and pushing images in your environment. You have decided to use it to push a simple nginx app that shows a static page.

Build the static index.html

Build the nginx with your loaded static content

<br>
<details>
<summary>Solution</summary>

Build a basic Packer file

```plain
mkdir /root/packer
cd /root/packer
```{{exec}}

Make a basic index.html

```plain
vi index.html
```{{exec}}

Press "i" and add the following lines

```plain
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My First Webpage</title>
</head>
<body>
    <h1>Welcome to ProLUG</h1>
    <p>Look around.</p>
</body>
</html>
```

Make the docker-nginx.pkr.hcl file

```plain
vi docker-nginx.pkr.hcl
```{{exec}}

Press "i" and add the following lines

```plain
packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1"
    }
  }
}

source "docker" "nginx_custom" {
  image  = "nginx:latest"
  commit = true
  changes = [
    "CMD [\"nginx\", \"-g\", \"daemon off;\"]"
  ]
}

build {
  sources = [
    "source.docker.nginx_custom"
  ]

  provisioner "file" {
    source      = "./index.html"
    destination = "/usr/share/nginx/html/index.html"
  }

  post-processor "docker-tag" {
    repository = "packer-nginx"
    tags       = ["latest"]
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

Run the image with docker to expose the web page

```plain
 docker run -d -p 8080:80 packer-nginx
```{{exec}}

Use curl to verify you can read the page

```plain
curl 127.0.0.1:8080
```{{exec}}

If this is all working, you're ready to move onto the next part.


</details>