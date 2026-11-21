Compare the hosts file with the real address, then fix it.

```plain
getent hosts app.lab
sed -i 's/^10\.99\.0\.99 app\.lab/10.99.0.1 app.lab/' /etc/hosts
getent hosts app.lab | tee /root/fix/name.txt
```{{exec}}

If the wrong entry is not the only one, remove duplicates rather than adding
another line.
