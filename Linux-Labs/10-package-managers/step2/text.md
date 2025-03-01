Use apt to install packages that you need on the system. Use apt to download all the updates that the system needs. Then, after review upgrade all the packages on the system and verify that everything worked correctly.

<br>

### Solution
<details>
<summary>Solution</summary>
We are starting a new project and you want to run Ansible in a lab environnment. Install ansible on your system.

```plain
time apt -y install ansible
```{{exec}}

How long did Ansible take to install?

What dependencies were installed with Ansible? You only told the system to install that one thing, why did it install all these other things?

Looking at the "Get" lines, where did most of these packages come from? #archive.ubuntu.com

What information was kept in the log for apt?

```plain
tail /var/log/apt/history.log
```{{exec}}

Do you see all the packages that you expect from the previous command entered here?

Now you want to bring a system up to compliance by upgrading and updating all the software on it.

Check the current cache size and then clear it so that you have no cached packages.

```plain
cd /var/cache/apt/archives
du -sh .
rm -rf *
du -sh .
```{{exec}}

Do you now see that your cached folder is empty? #Yes

Tell the system to gather a list from all available repositories that are available to update.

```plain
apt update
```{{exec}}

How many package are available for upgrade?

List them out.

```plain
apt list --upgradable
```{{exec}}

Your security team has been informing you that ssl and ssh packages are obsolete or exposed via a high CVSS score. Can you verify that they are going to be upgraded with the next update?

```plain
apt list --upgradable | grep -i ssh
apt list --upgradable | grep -i ssl
```{{exec}}

Can you tell the security team that you will be updating those packages? #yes

Execute the planned update of the system and verify that packages have been upgrade. #Hit ok, if anything prompts you for a question.

```plain
apt -y upgrade
```{{exec}}

Now you find out that your team is no longer allowed to have sysstat on development servers.

```plain
apt -y remove sysstat
```{{exec}}

How many kB of disk space is freed up by you removing this tool? What other packages were also removed?

Read the man pages for apt to figure out more use cases that you may need in the future.

</details>