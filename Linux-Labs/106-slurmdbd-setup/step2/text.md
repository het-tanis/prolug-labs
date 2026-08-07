You have installed Slurm on two nodes and started the daemon. You now need to configure the Mariadb server for Slurm. Then you need to configure SlurmDBD and configure it for the cluster.

<br>

### Solution
<details>
<summary>Solution</summary>

Ensure that the mariadb server is running
```plain
systemctl status mariadb
```{{exec}}

Verify operations

```plain
ss -ntulp | grep -i maria
lsof -i :3306
```{{exec}}

Configure slurm in mariadb
Follow these steps (Remove the > before each line, that is your prompt.)
```plain
mysql
    > CREATE DATABASE slurm_acct_db;
	> CREATE USER 'slurm'@'localhost' IDENTIFIED BY 'slurm1234';
	> GRANT ALL PRIVILEGES ON slurm_acct_db.* TO 'slurm'@'localhost';
	> FLUSH PRIVILEGES;
	> EXIT;
```

Configure the slurmdbd service

```plain
vi /etc/slurm/slurmdbd.conf
```{{exec}}

Add the following lines

```plain
# Add these lines
# Authentication and Daemon settings
AuthType=auth/munge
DbdHost=localhost
DbdPort=6819
SlurmUser=slurm
LogFile=/var/log/slurm/slurmdbd.log
PidFile=/var/run/slurmdbd.pid

# Database backend settings
StorageType=accounting_storage/mysql
StorageHost=localhost
StoragePort=3306
StorageUser=slurm
StoragePass=slurm1234
StorageLoc=slurm_acct_db
```

Fix permissions and set up the slurmdbd configuration.

```plain
chown slurm:slurm /etc/slurm/slurmdbd.conf
chmod 600 /etc/slurm/slurmdbd.conf
```{{exec}}

Create the /var/run/slurmdbd.pid file for execution

```plain
touch /var/run/slurmdbd.pid
chown slurm:slurm /var/run/slurmdbd.pid
chmod 700 /var/run/slurmdbd.pid
```{{exec}}

Fix the configuration for slurmctld

```plain
vi /etc/slurm/slurm.conf
```{{exec}}

Add or fix the following lines.

```plain
# Accounting Storage Configuration
AccountingStorageType=accounting_storage/slurmdbd
AccountingStorageHost=controlplane
AccountingStoragePort=6819
AccountingStorageUser=slurm

#Comment or remove the line:
#AccountingStorageType=accounting_storage/none

# Enforce limits or just track usage (optional but recommended)
AccountingStorageEnforce=associations,limits,qos
```

Restart the services.

```plain
systemctl restart slurmdbd
systemctl restart slurmctld
```{{exec}}

Add the cluster in to the slurmdbd accounting.
```plain
sacctmgr add cluster prolugcluster
```{{exec}}

We may see the message that this has already been added, so we can continue.

</details>