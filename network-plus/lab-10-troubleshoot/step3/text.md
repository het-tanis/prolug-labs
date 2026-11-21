Measure, inspect the qdisc, remove it, and measure again.

```plain
ping -c 3 10.99.0.1
```{{exec}}

How slow is your ping returning on this local connection?

```plain
tc qdisc show dev dummy0
tc qdisc del dev dummy0 root
ping -c 3 10.99.0.1 | tee /root/fix/latency.txt
```{{exec}}

Is this faster, after you removed the slow configuration test?

The first ping should average around 120 ms; the second should be local-fast.
Never "fix" latency without a before-and-after measurement.
