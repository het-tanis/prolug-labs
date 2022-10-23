#!/bin/bash

grep `df -h / | grep -v Size | awk '{print $2}'` /root/size
stat /root/bigfile