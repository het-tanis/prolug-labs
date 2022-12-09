### Lab Activities
Your team was so happy with your work on [Deploying a Web Server](https://killercoda.com/het-tanis/course/Linux-Labs/101-configure-apache-server) that 10 other teams have come and asked for you to do the same deployment for them.

Make a webserver available on node01

Set up a directive and web page that identifies each of the following web pages:

dev - port 8080

test - port 8081

qa - port 8082

Make sure each html page exists and has the name dev, test, and qa on the page. These will be provided by the individual teams and put in the /answers directory

<br>

<details>
<summary>Solution</summary>

Check your hosts file

```plain
cat /root/hosts
```{{exec}}

Check your virtual hosts and index files. Modify this command for all the files in that directory.

```plain
ls /answers/
cat /answers/dev_index.html
echo ""
cat /answers/dev_virtual_host.conf
```{{exec}}

Create each component of the /root/web_environment.yaml file. (If you get stuck you can find this file in /answers/web_environment.yaml)

Run against the [webservers] host group

```plain
---

- name: Web Environment
  hosts: webservers
  vars:
  gather_facts: True
  become: True
  tasks:

```

Create the section to install apache2

```plain
  - name: Install Apache2 Server
    apt:
      name: "apache2"
      state: latest
```

Create the directories for each environmentn

```plain
  - name: Create directories for environments
    file:
      path: "/var/www/html_{{item}}"
      state: directory
    loop:
    - dev
    - test
    - qa
    notify:
      - Restart apache
```

Add the listener ports to the correct configuration file

```plain

  - name: Add the Listener ports to /etc/apache2/ports.conf
    lineinfile:
      path: /etc/apache2/ports.conf
      insertafter: '^Listen'
      state: present
      line: "{{item}}"
    loop:
    - 'Listen 8080'
    - 'Listen 8081'
    - 'Listen 8082'
    notify:
      - Restart apache

```

Create the virtual directives for each web page

```plain
  - name: Push the Virtual Directives files into the correct place
    copy:
      src: "/answers/{{item}}"
      dest: "/etc/apache2/sites-enabled/{{item}}"
    loop:
    - dev_virtual_host.conf
    - qa_virtual_host.conf
    - test_virtual_host.conf
    notify:
      - Restart apache

```



Push the html files that the teams have given you into the right directories.

```plain
  - name: Push the html for each page over
    copy:
      src: "/answers/{{item.name}}"
      dest: "/var/www/html_{{item.env}}/index.html"
    loop:
    - { env: 'dev', name: 'dev_index.html'}
    - { env: 'test', name: 'test_index.html'}
    - { env: 'qa', name: 'qa_index.html'}
    notify:
      - Restart apache
```

In each of those blocks above you set a notification if something is changed. Now you have to create the handler that gets used in the event a notification happens.

```plain
  handlers:

  - name: Restart apache
    systemd:
      state: restarted
      name: apache2
```

If you need to copy the deployment file from the answers, use this.

```plain
cp /answers/web_environment.yaml /root/web_environment.yaml
```{{exec}}

Run your completed playbook to deploy all environments

```plain
ansible-playbook -i /root/hosts /root/web_environment.yaml
```{{exec}}

Run it a second time to see all the events that no longer have to happen. Did the handler run the second time? Why or why not?

Verify that each of the listeners are from the correct environments.
```plain
curl node01:8080
curl node01:8081
curl node01:8082
```{{exec}}

If this has all worked, you've completed this lab and are ready to move on.

</details>