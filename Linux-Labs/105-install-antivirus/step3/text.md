You've installed and updated your antivirus, now it's time to make it run on a schedule. Test the script found at /answers/clamscan.sh. 

Set the script to run daily.

Execute the script.

Set the script to run via cron at least daily.

<br>

### Solution
<details>
<summary>Solution</summary>

Set the script file to be executable.

```plain
chmod 755 /answers/clamscan.sh
```{{exec}}

Verify the permissions

```plain
ls -l /answers/clamscan.sh
```{{exec}}

View the file and see if you can determine what it is doing.

```plain
cat /answers/clamscan.sh
```{{exec}}

How many log files are being created in each run? Why do you you think this is?

What directory or path is being scanned?

Execute the script with a timer and see what the output is. 

This should take between 10 and 15 minutes, so let it run and go grab a drink.

```plain
time /answers/clamscan.sh
```{{exec}}

How long did the script take to run?

What values do you see in the output? Did you find any viruses? Does the output coincide with what you see in /var/log/clamav/clamav.log?

Set the script to execute daily (There's more than one way to do this)

Check if cron is running on the server?

```plain
systemctl status cron --no-pager
```{{exec}}

If you want it to run from cron.daily, you would do this.

```plain
cp /answers/clamscan.sh /etc/cron.daily/
```{{exec}}

The other way to set this to run daily, say at 0100 AM local time, would look like this:

```plain
crontab -e
```{{exec}}

Select your editor of choice from the menu.

Add the following line:

`0 1 * * * /answers/clamscan.sh`

Hit `esc :wq` to exit vi.

Check and verify that the crontab is set.

```plain
crontab -l
```{{exec}}

Hit submit to see your lab results.

</details>