Setup the system so that you can use a web browser to view the STIG report at a high level.

Install Apache2 web server.

Copy the appropriate results .html file to the web root.

View the report to verify your findings.

<br>

### Solution
<details>
<summary>Solution</summary>
Install the Apache2 server.

```plain
apt -y install apache2
```{{exec}}

Find the correct report. (This command assumes you've only run the scanner one time.)

```plain
cd /root/SCC/Sessions/*/Results/SCAP
```{{exec}}

Copy over the *ALL* .html file to the /var/www/html direcotry

```plain
cp *All* /var/www/html/index.html
```{{exec}}

Click on this link to access your score.

{{TRAFFIC_HOST1_80}}


View your STIG Score and see what remediations you have for CAT I, CAT II, and CAT III findings.

</details>
