Now you've looked around with the tools that you have. Let's figure out the order your system looks up resources in.

Inspect the /etc/nsswitch.conf file to see how your system looks up hosts.

Verify that your system looks at files before DNS by adding a record for www.google.com that points to www.yahoo.com.

Change the order of host lookup in /etc/nsswitch.conf to see the system properly resolve www.google.com

<br>

### Solution
<details>
<summary>Solution</summary>


```plain
cat /etc/nsswitch.conf
```{{exec}}

What are the values in the hosts: entry?

Test your connection to www.google.com with curl

```plain
curl www.google.com | grep -Ei 'yahoo|google'
```{{exec}}

You should see output that relates to google

Let's get the host value for www.yahoo.com

```plain
host www.yahoo.com
```{{exec}}

Now, just to test that our system will use hosts first, before DNS, we're going to add a www.yahoo.com entry in our /etc/hosts file

```plain
echo "74.6.231.21 www.google.com" >> /etc/hosts
```{{exec}}

Let's test a curl to www.google.com and see if we're still resolving to www.google.com

```plain
curl www.google.com | grep -Ei 'yahoo|google'
```{{exec}}

Now we change the order so that our /etc/nsswitch entry for hosts shows dns before host values

```plain
vi /etc/nsswitch.conf

#fix the line to:
hosts:      dns files
```

Now test www.google.com again and see if you're seeing the correct output.

```plain
curl www.google.com | grep -Ei 'yahoo|google'
```{{exec}}

If this works, you've successfully changed the order your system resolves names by editing /etc/nsswitch.conf.

</details>