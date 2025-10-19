### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your deployement teams have recently created a web server for a dev team. You get a ticket that one of the environments is not as is expected. Use ad-hoc and one off administration commands to fix the environment and get it in the correct operational state.

The expected state:

dev - port 8080

test - port 8081

qa - port 8082

<br>
<details>
<summary>Solution</summary>

Simulate the deployment (this is what would have happened before the ticket was put in, you're running it to setup the lab and watch the output.)

```plain
ansible-playbook -i /root/hosts broken_web_environment.yaml
```{{exec}}

What environment is deployed? What problems do you see compared to what you expected to see?

Can you check that the environment is working as expected or not?

```plain
curl node01:8080
curl node01:8081
curl node01:8082
```{{exec}}

Or maybe even more automation mindset like this
```plain
for port in 8080 8081 8082; do curl node01:$port; done
```{{exec}}

How might you find what broken in the deployment? We saw it run from start to finish, why didn't the deployer fail?

Did the wrong port get set somehow? How might you find that incorrect port?

```plain
nmap node01
```{{exec}}

Looks like someone fat-fingered, or otherwise incorrectly set port 8087 instead of 8082. Can you fix that with some one-off commands to get the environment correct?

```plain
ansible webservers -i /root/hosts -m lineinfile -a "path=/etc/apache2/ports.conf regexp='Listen 8087' line='Listen 8082'" 
```{{exec}}

If you check the system, did that fix it? Why or why not?

```plain
nmap node01
```{{exec}}

Remember we always have to restart the service to re-read a config file. We can do that with another one-off admin command.

```plain
ansible webservers -i /root/hosts -m service -a "name=apache2 state=restarted"
```{{exec}}

If you check the system, did that fix it? Why or why not?

```plain
nmap node01
```{{exec}}

```plain
for port in 8080 8081 8082; do curl node01:$port; done
```{{exec}}

So you've corrected this, but someone needs to go back and fix the original deployment from the team (and maybe fix that name). Inspect the file and see if you can find where it went wrong.

```plain
cat /root/broken_web_environment.yaml
```{{exec}}

</details>
