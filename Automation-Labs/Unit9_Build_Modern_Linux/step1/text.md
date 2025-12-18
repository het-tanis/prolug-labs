### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your development teams have decided to deploy Linux in a modern, containerless way.

Verify Ansible.

Install Warewulf and prepare the environment.

<br>
<details>
<summary>Solution</summary>

Check Ansible.

```plain
ansible --version
```{{exec}}

Remove local installed Go.

```plain
rm -rf /usr/local/go
```{{exec}}

```plain
apt purge golang-go
```{{exec}}

Install git

```plain
apt -y update && apt -y install make git
```{{exec}}

Download the compatible version of Go.

```plain
wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
```{{exec}}

Untar Go in place and edit the path.

```plain
tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```{{exec}}

Validate the correct 1.23 version of Go.

```plain
go version
```{{exec}}

Git clone Warewulf

```plain
git clone https://github.com/warewulf/warewulf.git
```{{exec}}

Setup and install warewulf

```plain
cd warewulf 
```{{exec}}

```plain
make 
```{{exec}}

This next step will take some time, so feel free to step away for a few minutes.

```plain
time make install 
```{{exec}}

How long did this build take? Why might you want to record this?

If warewulf is installed correctly, you are ready to move to the next step. Do not start the warewulf service in this lab. It is neither required, nor will it work correctly in the Killercoda lab environment.

</details>
