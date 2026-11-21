Create a key and a self-signed certificate.

```plain
cd /root/tls
openssl req -x509 -newkey rsa:2048 -nodes \
  -keyout lab.key -out lab.crt -days 1 \
  -subj "/CN=lab.local/O=Network Lab"
chmod 600 lab.key
openssl x509 -in lab.crt -noout -subject -dates
```{{exec}}

A self-signed certificate is trusted only by someone who installs it. That is
the point of the trust store.
