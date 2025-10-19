### Lab Activities

The team is happy that the system is updated and working properly. Now they have provided you a new file that they urgently need pushed into the qa environment. See if you can push that file for them with admin and one-off commands.


<br>
<details>
<summary>Solution</summary>

Verify the web page as it currently exists.

```plain
curl node01:8082
```{{exec}}

Push the update via ansible

```plain
ansible webservers -i /root/hosts -m copy -a "src=/answers/fixed_qa_index.html dest=/var/www/html_qa/index.html"
```{{exec}}

Check that the page updated.

```plain
curl node01:8082
```{{exec}}

But wait, did this require a restart of the apache web service? Why or why not? What is different here?

</details>