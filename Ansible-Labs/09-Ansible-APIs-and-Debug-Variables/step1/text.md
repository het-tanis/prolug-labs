### Lab Activities
Verify your /root/hosts file and /root/api.yaml

Create a playbook that calls from https://swapi.dev/api/people/ via the uri method.

Return JSON output and debug to see values returned by various calls.

<br>
<details>
<summary>Solution</summary>

```plain
cat /root/hosts
```{{exec}}

```plain
cat /root/api.yaml
```{{exec}}

Run the Playbook to see the output
```plain
ansible-playbook api.yaml
```{{exec}}

Edit the playbook to give you just the information on the first entry.
Uncomment these lines
```
    #- name: Debug variables to view contents
    #  debug:
    #    var: swapi.json.results[0]
```

Rerun the Playbook to see the new output
```plain
ansible-playbook api.yaml
```{{exec}}


</details>