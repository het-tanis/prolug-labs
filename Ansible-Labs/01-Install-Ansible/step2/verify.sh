#!/bin/bash

modules=`ansible-doc -l | wc -l`
grep $modules /root/modules