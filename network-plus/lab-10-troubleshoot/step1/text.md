Ask the kernel which path it would take, then remove the
blackhole.

```plain
ip route get 10.99.0.1
```{{exec}}

What is the expected route to get to 10.99.0.1?

```plain
ip route del blackhole 10.99.0.0/24
ping -c 2 10.99.0.1
ip route get 10.99.0.1 | tee /root/fix/route.txt
```{{exec}}

`ip route get` is the fastest way to separate a routing problem from a service
problem.
