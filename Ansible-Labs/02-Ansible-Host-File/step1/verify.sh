#!/bin/bash

stat /root/hosts
grep controlplane /root/hosts
grep "\[servers\]" /root/hosts
