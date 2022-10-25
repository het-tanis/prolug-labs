#!/bin/bash

stat /root/hosts
grep "\[servers\]" /root/hosts
grep controlplane /root/hosts
grep node01 /root/hosts
