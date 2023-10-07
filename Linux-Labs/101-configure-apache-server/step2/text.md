You've set up a webserver, but your team has a requirement to test against 3 different environments.

Set up a directive and web page that identifies each of the following web pages:

dev - port 8080

test - port 8081

qa   - port 8082

Make sure each html page exists and has the name dev, test, and qa on the page.

<br>

### Solution
<details>
<summary>Solution</summary>
Go back to node01 to begin configuration

```plain
ssh node01
```{{exec}}

First, make the directories that will be used as document root for each environment.

```plain
mkdir /var/www/html_{dev,test,qa}
```{{exec}}

Now we have to set up the listener for each of those ports

```plain
vi /etc/apache2/ports.conf
```{{exec}}

Add the lines below, below the ` Listen 80 ` line

```plain
Listen 8080
Listen 8081
Listen 8082
```

Next we're going to create a directive for each of those sites. Now this could be each in their own file, but for simplicity's sake we'll make them all in one place.

```plain
vi /etc/apache2/sites-enabled/testing-team.conf
```{{exec}}

Add the following information to the file. This may seem like a lot, but it's actually just created by following the directives you can find in the /etc/apache2 directory.

```plain
<VirtualHost *:8080>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html_dev

        ErrorLog ${APACHE_LOG_DIR}/dev_error.log
        CustomLog ${APACHE_LOG_DIR}/dev_access.log combined

</VirtualHost>

<VirtualHost *:8081>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html_test

        ErrorLog ${APACHE_LOG_DIR}/test_error.log
        CustomLog ${APACHE_LOG_DIR}/test_access.log combined

</VirtualHost>

<VirtualHost *:8082>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html_qa

        ErrorLog ${APACHE_LOG_DIR}/qa_error.log
        CustomLog ${APACHE_LOG_DIR}/qa_access.log combined

</VirtualHost>
```

The last step will be to create simple websites in each of the DocumentRoot directories for each webpage.

```plain
vi /var/www/html_dev/index.html
```{{exec}}

Put this information in the page.

```plain
<html>
<head><title>Dev Page</title></head>
<body>Dev Environment</body>
</html>
```

```plain
vi /var/www/html_test/index.html
```{{exec}}

Put this information in the page.

```plain
<html>
<head><title>Test Page</title></head>
<body>Test Environment</body>
</html>
```

```plain
vi /var/www/html_qa/index.html
```{{exec}}

Put this information in the page.

```plain
<html>
<head><title>QA Page</title></head>
<body>QA Environment</body>
</html>
```

With that all set up, let's restart the server and test our connections

```plain
systemctl restart apache2
```{{exec}}

Let's see if all our ports are being listened to

```plain
ss -ntulp | grep 80
lsof -i :8080
lsof -i :8081
lsof -i :8082
```{{exec}}

Now we run a curl command against each environment in a for loop.

```plain
for port in 8080 8081 8082; do curl 127.0.0.1:$port | grep -iE "dev|qa|test"; done
```{{exec}}

</details>
