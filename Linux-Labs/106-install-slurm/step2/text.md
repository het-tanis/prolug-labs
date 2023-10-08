You have installed Slurm on two nodes and started the daemon. You want to verify the status of the cluster and the individual node readiness states.

<br>

### Solution
<details>
<summary>Solution</summary>

Run the command scontrol show config to see the state of the cluster. What information is important to see here?
```plain
scontrol show config
```{{exec}}

Run the sinfo -N command to see the state of the nodes.

```plain
sinfo -N
```{{exec}}

How many nodes do you see? What are the node status and what do those mean? (man sinfo or sinfo --help)

What new information do you see when you add to the sinfo command?

```plain
sinfo -N l
```{{exec}}

If you are confident that you cluster is running properly, you can move on to the next stage, which is running simple and batch type jobs against the system.

</details>