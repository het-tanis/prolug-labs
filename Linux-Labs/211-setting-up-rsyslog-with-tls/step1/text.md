Your team has determined that they need to centralize logging in the environment. This is a Security Technical Implementation Guide (STIG) for government systems. But, in your case, it's just a good practice and your team has been losing remediation time by not being able to see logs on systems until after the systems are back up. 

Your previous setup of rsyslog did not encrypt the traffic between systems and was called out in a red team finding. You know that TLS can be set up, but your organization doesn't have a PKI infrastructure.

Verify that rsyslog is installed and running on both systems.

Setup the certificates

Configure rsyslog on controlplane to capture TCP on 6514.

Verify that rsyslog is listening on TCP port 6514.

<br>

### Solution
<details>
<summary>Solution</summary>

Ensure both servers have the correct software
```plain
apt -y install gnutls-bin rsyslog-gnutls
```{{exec}}

```plain
ssh node01 'apt -y install gnutls-bin rsyslog-gnutls'
```{{exec}}

Setup TLS certificates for the test environment

Change to the appropriate directory

```plain
cd /usr/local/share/ca-certificates
```{{exec}}

Generate private key as a Certificate Authority (to sign all other keys)
```plain
certtool --generate-privkey --outfile ca-key.pem
```{{exec}}

Generate self-signed cert  

```plain
certtool --generate-self-signed --load-privkey ca-key.pem --outfile ca.pem
```{{exec}}

  Select defaults
  Organization name: ProLUG
  Make expiration 90 days
  Select defaults
  Select "y" for Is the above information ok?

Verify both ca-key.pem and ca.pem have been created
```plain
ls -l
```{{exec}}

What permissions do you see on these files?

#Generate a new private key for controlplane

```plain
certtool --generate-privkey --outfile key.pem
```{{exec}}

Generate a certificate request for controlplane

```plain
certtool --generate-request --load-privkey key.pem --outfile request.pem
```{{exec}}

Sign the certificate request for controlplane

```plain
certtool --generate-certificate --load-request request.pem --outfile cert.pem --load-ca-certificate ca.pem --load-ca-privkey ca-key.pem
```{{exec}}}

  Make expiration 60 days
  Is this a TLS web client certificate? (y/N): y
  Enter a dnsName of the subject of the certificate: controlplane
  Make expiration 60 days
  Accept all other defaults
  Select "y" for Is the above information ok?

Validate any information by checking the cert

```plain
certtool --certificate-info --infile cert.pem | grep -i control
```{{exec}}

Fix permissions on the local key.pem so syslog user can securely read it.

```plain
chown root:syslog /usr/local/share/ca-certificates/key.pem 
chmod 640 /usr/local/share/ca-certificates/key.pem
```{{exec}}

Verify all permissions
```plain
ls -l
```{{exec}}

Configure rsyslog on controlplane to capture TCP on the default port 6514.

```plain
vi /etc/rsyslog.conf
```{{exec}}

Add the following to the bottom of the file

```plain
############################
# Custom TLS Server
############################

global(
DefaultNetstreamDriver="gtls"
DefaultNetstreamDriverCAFile="/usr/local/share/ca-certificates/ca.pem"
DefaultNetstreamDriverCertFile="/usr/local/share/ca-certificates/cert.pem"
DefaultNetstreamDriverKeyFile="/usr/local/share/ca-certificates/key.pem"
)

module(
Load="imtcp"
StreamDriver.Name="gtls"
StreamDriver.Mode="1"
StreamDriver.Authmode="anon"
)

input(
type="imtcp"
port="6514"
)
```

Hit esc :wq to write and quit

You know that systems do not take configuration file changes without a restart of the service, so restart rsyslog

```plain
systemctl restart rsyslog
```{{exec}}

```plain
systemctl status rsyslog
```{{exec}}

Verify that your system is listening on port 6514 for TCP traffic.

```plain
ss -ntulp | grep 6514
```{{exec}}

You are ready to head to the next part of the lab.

</details>
