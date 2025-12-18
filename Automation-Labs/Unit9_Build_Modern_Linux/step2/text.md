### Lab Activities

Your team needs a new version of Rocky Linux to deploy to the nodes Warewulf will control.

1. Download a Rocky 9 Image

2. Verify the image is loaded into Warewulf

3. Inspect the image and test update capability

4. Verify the location of the chroot environment that Warewulf stores the image location in

<br>
<details>
<summary>Solution</summary>

Download and the Rocky 9 Image.

```plain
time wwctl image import --build docker://ghcr.io/warewulf/warewulf-rockylinux:9 my-rocky-image
```{{exec}}

Test that the image has been loaded into Warewulf.

```plain
wwctl image list
```{{exec}}

Check our current kernel image and version of OS that we are running on.


```plain
uname -r
```{{exec}}

```plain
cat /etc/*release
```{{exec}}

Drop into the chrooted environment through Warewulf image shell and verify the kernel and version of OS you're on.

```plain
wwctl image shell my-rocky-image
```{{exec}}

```plain
uname -r
```{{exec}}

```plain
cat /etc/*release
```{{exec}}

Did you notice the differences? Are there any similarities? Why do you think this is?

Attempt to update to validate that the system is connecting to the rocky image repositories.

```plain
dnf update
```{{exec}}

Hit "N", as we do not want to update right now.

Exit the image without making any changes

```plain
false
exit
```{{exec}}

What error code do we see? Why do we see this error code? What does the system tell us about it?

Verify that you know where the chrooted environments are stored in Warewulf.

```plain
find / -name warewulf
```{{exec}}

You should see something with "chroots"

```plain
cd /var/local/warewulf/chroots/my-rocky-image/
ls
```{{exec}}

Do you see the rootfs environment?

</details>