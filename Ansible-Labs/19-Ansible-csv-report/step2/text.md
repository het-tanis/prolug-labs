### Lab Activities
So now that we have the role and playbook correct, let's execute and see it work.

Test the playbook ` data_gather `.


<br>
<details>
<summary>Solution</summary>

Run the Playbook to see it work.

```plain
ansible-playbook -i /root/hosts /root/playbooks/data_gather.yaml
```{{exec}}

When runs, does it show the debug output? How do you know?

Check the output of the report. 

Is it a properly formatted .csv? How can you tell?

```plain
ls -l /root/playbooks/reports/*.csv
cat /root/playbooks/reports/*.csv
```{{exec}}

Run it again as below, and see if you get the debug output.

```plain
ansible-playbook -vv -i /root/hosts /root/playbooks/data_gather.yaml
```{{exec}}

Did you see the debug output of all the variables? What caused this?

Check the output of the reports again to see that there are now more than one.

```plain
ls -l /root/playbooks/reports/*.csv
cat /root/playbooks/reports/*.csv
```{{exec}}

</details>
