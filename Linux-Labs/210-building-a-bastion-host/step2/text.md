You've setup the jail it's time to put together the bastion portion.

Create a user on node01 called jaileduser

Create a user on controlplane called freeuser

Create a bastion.sh script to lock in the actions of jaileduser

Configure sshd to jail jaileduser.

<br>

### Solution
<details>
<summary>Solution</summary>
Create a user called freeuser on controlplane

```plain
useradd -m freeuser
```{{exec}}

Give the user a password of 12345678

```plain
passwd freeuser
```{{exec}}

You will have to enter it twice, it will not echo to the screen.

Create a user called jaileduser on node01

```plain
ssh node01
```{{exec}}

```plain
useradd -m jaileduser
```{{exec}}

Give the user a password of 12345678

```plain
passwd jaileduser
```{{exec}}

Jail the user's ssh sessions

```plain
vi /etc/ssh/sshd_config
```{{exec}}

Add the following lines at the bottom

```plain
Match User jaileduser
ChrootDirectory /var/chroot
```

Save the file with :wq or 'Shift + ZZ'

Restart the ssh daemon

```plain
systemctl restart ssh
```{{exec}}

Make a bastion.sh script and put it in the correct location for the jaileduser to execute it.

```plain
vi /root/bastion.sh
```{{exec}}

```plain
#!/bin/bash

#Input a number
read -n 2 -t 20 -p "Make your selection from the items below
You have 20 seconds

1. Connect to controlplane as freeuser.
2. Exit
" input

case $input in

1 )
  echo "You are being sent to Rocky1"
  /usr/bin/ssh freeuser@controlplane
  exit 0;
  ;;
2 )
  echo "You are leaving now."
  exit 0;
  ;;
* )
  echo "You have not entered a valid input"
  exit 0;
  ;;

esac

exit 0;

```

Save the file with :wq or 'Shift + ZZ'

Copy this file to the correct location in /var/chroot/bin/bastion.sh and ensure it is executable

```plain
cp /root/bastion.sh /var/chroot/bin/bastion.sh
chmod 755 /var/chroot/bin/bastion.sh
```{{exec}}

Ensure that /etc/passwd is correctly set for jaileduser to have /bin/bastion.sh as their shell.

```plain
vi /etc/passwd
```{{exec}}

use /jaileduser to search for their name and "i" to correct the 7th field to /bin/bastion.sh

Copy the correct /etc/passwd into the jail.

```plain
cp /etc/passwd /var/chroot/etc/passwd
```{{exec}}

Exit back to controlplane and hit submit for the next section.

```plain
exit
```{{exec}}

</details>