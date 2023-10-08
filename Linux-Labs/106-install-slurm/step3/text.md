It's time to run some jobs on your cluster.

Run a simple job against one node.

Run a simple job against both nodes.

Run a batch job against one node.

<br>

### Solution
<details>
<summary>Solution</summary>

Schedule a job to run against one node.

```plain
srun -n 1 hostname
```{{exec}}

What happened, and what was the output? Was that expected?

Schedule a job to run against both nodes.

```plain
srun -n 2 hostname
```{{exec}}

Is this output as you expected?

What happens when you schedule a run against more nodes than you have in the cluster.

```plain
srun -n 10 hostname
```{{exec}}

How did this behave differently than you saw in the other commands? You may have to kill this command with crtl + c . Does it make sense that you tried to schedule against more nodes than you had, and the system did not react well?

Now it is time to run a batch job and look at the configurations we can set inside of a config file.

Examine the /root/submit.sh file and look at the parameters configured.

```plain
cat /root/submit.sh
```{{exec}}

Submit the submit.sh to the cluster for execution, and immediately look at the queue to see the job status.

```plain
sbatch /root/submit.sh; squeue
```{{exec}}

Can you see the job ID? Can you tell what node this job is executing on?

When this has completed, check the file output that was defined. Verify that the node hostname matches what you saw in your squeue command. Does it? 

```plain
cat /root/result.txt
```{{exec}}

What is the output and was it expected from the node(s) that this executed on?

</details>