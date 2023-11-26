Your team wants you to set up a POC (Proof of Concept) around scheduling jobs across multiple nodes. The end goal is running a compute cluster that functions like a HPC (high performance compute) cluster.

Install Slurm and have the appropriate daemons running.

<br>

### Solution
<details>
<summary>Solution</summary>

Update your apt repository.

```plain
apt update -y
```{{exec}}

Install Slurmd, Slurmtcld, and Munge daemons on the controlplane node.

```plain
apt install slurmd slurmctld -y
```{{exec}}

Install Slurmd and Munge daemons on the node01 node.

```plain
ssh node01 'apt install slurmd -y'
```{{exec}}

Copy the over the munge key from controlplane to node01 so that munge is communicating. Slurm requires munge to communicate with the end nodes.

```plain
scp /etc/munge/munge.key node01:/etc/munge/munge.key
```{{exec}}

Restart the munge daemon.

```plain
ssh node01 'systemctl restart munge'
```{{exec}}

Now that you have munge working correctly, it's time to configure Slurm. You may use the link [here](https://slurm.schedmd.com/configurator.html) to build one in the web tool, or you may copy the answer file from /answers/slurm.conf provided in this lab.

```plain
cp /answers/slurm.conf /etc/slurm-llnl/slurm.conf
```{{exec}}

Review the configuration to see the cluster name.
Review the configuration to see the slurmdctl node.
Review the configuration to see the partition name.
Review the configuration to see the nodes definitions

```plain
cat /answers/slurm.conf 
```{{exec}}

Copy this config to the other node

```plain
scp /etc/slurm-llnl/slurm.conf node01:/etc/slurm-llnl/slurm.conf
```{{exec}}

Restart the slurm services on controlplane

```plain
systemctl restart slurmctld
systemctl restart slurmd
```{{exec}}

Restart the slurmd service on node01

```plain
ssh node01 'systemctl restart slurmd'
```{{exec}}

Verify that munge is running on controlplane

```plain
systemctl status munge --no-page
```{{exec}}

Verify that slurmd is running on controlplane and that slurmd is listening on it's defined port.

```plain
systemctl status slurmd --no-pager
ss -ntulp | grep -i slurm
```{{exec}}

Once this is complete, you have stood up a Slurm cluster of 2 nodes, and you can begin to test in the next section.


</details>











