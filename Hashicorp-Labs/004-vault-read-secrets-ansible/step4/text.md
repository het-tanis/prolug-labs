Everything in Vault is set up. So now you have to use Ansible to pull the information. Since we cannot leave our passwords in Ansible out in the open, we will be using an ansible vault to hold our ansible user information.

Create a playbook that uses the username and password to get a vault token.

Secure your username and password in an Ansible Vault file.

Modify your playbook to then feed the token back into Vault and read the secret data from the path `secret/app1/values`. 

Write the username and password out to a file with a jinja2 template. (Not what we would do with them, but useful to show we understand variable manipulation.)

<br>

### Solution
<details>
<summary>Solution</summary>

Llet's make sure Ansible is installed in our environment

```plain
apt -y install ansible
```{{exec}}

Create an ansible playbook that can authenticate to vault `/root/secret-read.yaml`

```plain
---
- name: Read variables
  hosts: localhost
  vars:
  gather_facts: True
  become: False
  tasks:


  - name: test my connection to vault for credentials
    uri:
      url: "http://127.0.0.1:8200/v1/auth/userpass/login/{{username}}"
      return_content: yes
      method: POST
      body_format: json
      body: { password : "{{ password }}" }
    register: user_connect

  - name: Debug user_connect
    debug:
      var: user_connect
```

Run a test of the playbook with variables at the command line. (This is not secure, but we want to see it run.)

```plain
ansible-playbook /root/secret-read.yaml --extra-vars "username=ansible password='ansible12#$'"
```{{exec}}

Now we'll add those to a vault file.

```plain
ansible-vault create vault.yaml
```{{exec}}

Create a password `Ansible1234` and the add the lines

```plain
username: ansible
password: ansible12#$
```

Add the following lines to your playbook

```plain
---
- name: Read variables
  hosts: localhost
  vars:
  #Added ----------------
  vars_files:
  - /root/vault.yaml
  # ---------------------
  gather_facts: True
  become: False
```

Re-run the playbook and verify the vault is working (you will have to put in the vault password now.)

```plain
ansible-playbook --ask-vault-pass /root/secret-read.yaml
```{{exec}}

Note our token is: `user_connect.json.auth.client_token` in our json output

Now we've secured our credentials and we've read the token. Let's add to our playbook and give Vault that token to read the credentials.

```
#Add this below previous playbook task

  - name: Read the secret
    uri:
      url: "http://127.0.0.1:8200/v1/secret/data/app1/values"
      method: GET
      return_content: yes
      headers:
        X-Vault-Token: "{{ user_connect.json.auth.client_token }}"
    register: secret_creds

  - name: debug the secret_creds 
    debug:
      var: secret_creds

```

Verify that you can read the data out in the debug output.

Challenge: Can you read the exact data into debug variables?

```plain
  - name: Show the individual username
    debug:
      var: secret_creds.json.data.data.username

  - name: Show the individual password
    debug:
      var: secret_creds.json.data.data.password
```

Re-run the playbook with those lines added and see if you can see the username and password.

</details>