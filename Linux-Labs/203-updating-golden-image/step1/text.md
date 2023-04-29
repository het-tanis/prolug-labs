Your Server team has a golden image that it uses to deploy new servers. There is a security requirement to not introduce old vulnerabilities into the environment when deploying new servers. Your task is to update the image to the newest software packages. This process happens quarterly in your environment. The server has been started and you need to update the software before repackaging server back into an image.

Verify when the system was last patched.

Check if the system needs to reboot.

See if the system has any patches that are ready to deploy.

Look to see if there are any ssl packages that need to be updated.

<br>

### Solution
<details>
<summary>Solution</summary>
Verify when the system was last patched.

```plain
cat /var/log/apt/history.log
```{{exec}}

When was this system last patched? Can you verify it wasn't today?

Use this block of code to see if today's date shows up in the patch log

```plain
grep $(date +%F) /var/log/apt/history.log
```{{exec}}

Check if the system thinks it needs to be restarted.

```plain
ls -l /var/run/reboot-required
```{{exec}}

If that exists the system thinks it needs to be restarted.

Check what packages are the cause of the system wanting to reboot.

```plain
cat /var/run/reboot-required.pkgs
```{{exec}}

Install a command that will help you determine when the system wants to reboot. This is useful in enterprise environments so that you can see how your servers view their libraries and kernel states.

```plain
apt install -y needrestart
```{{exec}}

Check if your system needs to be restarted.

```plain
needrestart -l
```{{exec}}

Check if the system has anything ready to update.

```plain
apt update
```{{exec}}

This checked the metadata of your packages and saw if there are any upgradable packages. How many packages were upgradable?

Check which packages are upgradable.

```plain
apt list --upgradable
```{{exec}}

Check if there are any ssl packages that need to be updated?

```plain
apt list --upgradable | grep -i ssl
```{{exec}}

Do you see any packages with ssl that need to be upgraded?

</details>