### Lab Activities
You've been extremely successful. Now the teams want the ability to turn off or re-deploy only parts of the environments as needed. They want each piece to exist independently of each other. 

Break out the playbook and turn off the listener for test on port 8081. 


<br>
<details>
<summary>Solution</summary>

There's no answers here. You have to do this one on your own, you can do it manually but know that you're going to be doing that a lot for all those developer teams.

Ok, there's an answer found at /answers/individual_web_environment.yaml.

Copy that file over

```plain
cp /answers/individual_web_environment.yaml /root/individual_web_environment.yaml
```{{exec}}

Inspect that file and see how it is different than the other file. What is the use of block and when conditions doing in this file?

```plain
cat /root/individual_web_environment.yaml
```{{exec}}

What variables must you provide at the deployment of the file?

```plain
ansible-playbook -i /root/hosts /root/individual_web_environment.yaml --extra-vars "deploy=absent env=test port=8081"
```{{exec}}

Play with these and see what variables you can and cannot use. To finish the lab ensure that test port 8081 is off, per the requirement.

</details>
