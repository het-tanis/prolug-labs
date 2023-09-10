Now that you've created a mysql deployment and service, it's time to test that you can connect to it.

Create a mysql-client and ensure that the DB connection is working.

Write a table and read data from it, in mysql.

<br>
<details>
<summary>Solution</summary>
Deploy a pod to use to connect to the mysql database

```plain
kubectl run mysql-client --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash
```{{exec}}

You will see that you have dropped into a pod bash shell.

Run a connection test and see if you get data back.

```plain
mysql -h mysql-service -uroot -p'Very$ecure1#' -e 'SHOW databases;'
```{{exec}}

Did this show anything, why or why not?

Let's put information into the database. Connect like this.

```plain
mysql -h mysql-service -uroot -p'Very$ecure1#'
```{{exec}}

```plain
use mysql;
CREATE TABLE persons (personID int, LastName varchar(255), FirstName varchar(255));
```

Exit the mysql connection

```plain
exit
```{{exec}}


What information did we see back? Why is it relevant.

Test the read of the table you created.

```plain
mysql -h mysql-service -uroot -p'Very$ecure1#' -e 'use mysql; show tables; select * from persons'
```{{exec}}

</details>