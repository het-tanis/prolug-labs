### Lab Activities

You have examined the basic loading of variables into Ansible. Now you want to collect variables during execution and make decisions based on those variables.

<br>
<details>
<summary>Solution</summary>

Check the uptime of the system with a shell command, register the variable, and then debug it to the screen.

vi uptime_check.yaml

```plain
- hosts: localhost
  gather_facts: true
  vars:
  tasks:
   
  - name: Register an uptime run
    shell: uptime
    register: uptime_var

  - name: Debug the uptime variable to inspect it
    debug:
      var: uptime_var
```

Run the play and see ansible execute a shell command called uptime, register the variable and then debug the output to the screen

```plain
ansible-playbook uptime_check.yaml
```{{exec}}

What output do you see collected about that command?

Let's do something with that output to see how conditionals work in Linux. Add this to your uptime_check.yaml file, just the last task.

```plain
- hosts: localhost
  gather_facts: true
  vars:
  tasks:

  - name: Register an uptime run
    shell: uptime
    register: uptime_var

  - name: Debug the uptime variable to inspect it
    debug:
      var: uptime_var

  - name: Print out "everything good" if the rc above is equal to 0
    debug:
      msg: "Everything good"
    when: uptime_var.rc == 0
```

Run the play and see if the new output shows "Everything good"

```plain
ansible-playbook uptime_check.yaml
```{{exec}}

What is this trying to do? Did this work correctly?

Now add the following task to uptime_check.yaml and run it again

```plain
  - name: Print out "up more than a day" if the stdout contains the word day.
    debug:
      msg: "up more than a day"
    when: '"day" in uptime_var.stdout'
```

What is this trying to do? Did this work correctly? How could you test? (Hint: maybe try the word min to verify that the search is working correctly.)


</details>