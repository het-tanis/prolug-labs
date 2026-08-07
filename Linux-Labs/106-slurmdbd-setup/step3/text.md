Now we want to verify that our database is monitoring job submission stats inside of Slurm.

Execute some jobs with slurm.

Verify that the jobs have completed and are in the slurm database.

<br>

### Solution
<details>
<summary>Solution</summary>

Schedule a job to run against one node.

```plain
srun -n 1 hostname
```{{exec}}

Schedule a job to run against both nodes.

```plain
srun -n 2 hostname
```{{exec}}

Verify the information you can see inside of slurm accounting

```plain
sacct
```{{exec}}

What output did you see?
Can you see the two jobs and information about them?

Run a batch job against the cluster.

```plain
sbatch /root/submit.sh; squeue
```{{exec}}

Wait the 60 seconds for this job to complete and then continue.

Check the accounting to see if you see the completed job

```plain
sacct
```{{exec}}

Submit multiple jobs to see how Slurm handles it on your system.

```plain
sbatch /root/submit.sh
sbatch /root/submit.sh
sbatch /root/submit.sh
```{{exec}}

Wait the 60 seconds for these jobs to complete and then continue.

Check the accounting to see if you see the completed job

```plain
sacct
```{{exec}}

You may also want to run squeue to see status

```plain
squeue
```{{exec}}

Did all of your jobs complete? Were there errors? If so, why did they fail? Where else might you look for logs, or information?


</details>