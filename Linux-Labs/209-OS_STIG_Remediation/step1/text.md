Your team has to integrate with a U.S. Government system. There is a security requirement that you need to STIG (Security Technical Implementation Guide) your servers to a certain score. You have decided to remediate using the DoD Ansible playbook provided by the U.S. Government.

Download and unpackage the playbook.

Investigate the playbook default values and tasks.

<br>

### Solution
<details>
<summary>Solution</summary>
Create a directory to facilitate your work.

```plain
mkdir /root/stigs
cd /root/stigs
```{{exec}}

Download the Ansible playbook from the Govenment site.

```plain
wget -O U_CAN_Ubuntu_20-04_LTS_V1R11_STIG_Ansible.zip  https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_CAN_Ubuntu_20-04_LTS_V1R11_STIG_Ansible.zip
```{{exec}}

Unzip the package.

```plain
unzip U_CAN_Ubuntu_20-04_LTS_V1R11_STIG_Ansible.zip 
```{{exec}}

Make a directory for the playbook

```plain
mkdir ansible
```{{exec}}

move the playbook zip file into that directory

```plain
mv ubuntu2004STIG-ansible.zip ansible
```{{exec}}

Unzip the playbook zip file

```plain
cd ansible
unzip ubuntu2004STIG-ansible.zip
```{{exec}}

Investigate the STIG playbook

```plain
cd /root/stigs/ansible/roles/ubuntu2004STIG
ls
```{{exec}}

What directories do you see?

Look at the default values for the playbooks.

```plain
vim defaults/main.yml
```{{exec}}

Exit vim when completed #Shift ZZ will get you out.

Look at the tasks for the playbooks.

```plain
vim tasks/main.yml
```{{exec}}

You can continue on to next section.

</details>
