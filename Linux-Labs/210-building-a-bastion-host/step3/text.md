It is now time to test your bastion connection.

Connect from controlplane to node01 as the jaileduser user.

Verify functionality (or lack thereof) of your shell.

Finish the connection back to controlplane as freeuser and verify that you are indeed free of the jail.

<br>

### Solution
<details>
<summary>Solution</summary>
Ensure you are on controlplane

```plain
hostname
```{{exec}}

If not exit back to there.

Connect to node01 as the jaileduser

```plain
ssh jaileduser@node01
```{{}}

Enter your password 12345678

Follow your prompts and see if you can get into freeuser with password 12345678 back on controlplane.

If everything works, exit back out and see that you do not stop in the bastion, you leave the whole system. You should be back on controlplane.

```plain
exit
```{{exec}}

Test the timeout functionality of your server. Test that you cannot leave that script/shell by any other means. If that all validates then continue on.

Hit submit to finish this lab.

</details>