### Lab Activities

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

You have found yourself in a bash shell. You are trying to better understand inventories so you can run your automations by inputting values given to you from other parts of your organization.

Run the .sh script and attempt to 

<br>
<details>
<summary>Solution</summary>

Your organization has an API to hit to pull the names of servers. To simulate this, we are using earthquakes from the USGS in an API that should always be available. 

Execute the api call and see if you can read the data.

```plain
/root/u3_script.sh
```{{exec}}

What are the data showing?

What does the script look like in bash?

```plain
cat /root/u3_script.sh
```{{exec}}

What tools or techniques were used to gather this data? Could you modify the api to call something else?

Could you pipe this output to call only the fields between the "-", specifically the second field?

Read the provided users.csv file. This represents some data sent over to you by a project manager or other non-technical resource in your organization. They used a format they got the data in, and now you're going to have to use it.

```plain
cat /root/users.csv
```{{exec}}

What do you notice about this data format? Can you parse this for just the first and third fields?

```plain
cat /root/users.csv | awk -F , '{print $1,$3}'
```{{exec}}

Does this look correct to you? How might you use this data? 

How might you strip the header off as you use the data?

If you need to regenerate the data use this script.

```plain
/root/u3_script_user_generator.sh
```{{exec}}

Does it repopulate the data?

```plain
cat /root/users.csv
```{{exec}}

Can you modify this script and generate other data? (use this as reference: https://documenter.getpostman.com/view/19878710/2s93Jrwk3R)


</details>
