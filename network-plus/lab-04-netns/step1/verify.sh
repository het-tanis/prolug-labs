#!/bin/bash
ip netns list | grep -qw ns1 || { echo "ns1 is missing"; exit 1; }
ip netns list | grep -qw ns2 || { echo "ns2 is missing"; exit 1; }
ip -n ns1 -4 addr show veth1 | grep -q '172.16.0.1/24' || { echo "ns1 address missing"; exit 1; }
ip -n ns2 -4 addr show veth2 | grep -q '172.16.0.2/24' || { echo "ns2 address missing"; exit 1; }
echo "namespaces and veth built"
