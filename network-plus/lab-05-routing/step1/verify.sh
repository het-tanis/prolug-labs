#!/bin/bash
ip -n ns1 -4 addr show veth1 | grep -q '10.1.1.2/24' || { echo "ns1 address missing"; exit 1; }
ip -n ns2 -4 addr show veth2 | grep -q '10.2.2.2/24' || { echo "ns2 address missing"; exit 1; }
ip -n router -4 addr show r1 | grep -q '10.1.1.1/24' || { echo "router r1 address missing"; exit 1; }
ip -n router -4 addr show r2 | grep -q '10.2.2.1/24' || { echo "router r2 address missing"; exit 1; }
echo "topology built"
