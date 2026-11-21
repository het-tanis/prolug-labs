Use `ipcalc` on `10.20.0.0/22`.

```plain
ipcalc 10.20.0.0/22 | tee /root/subnet/calc.txt
```{{exec}}

Record network, broadcast, netmask and host range. A /22 has 1,024 addresses
and 1,022 usable hosts.
