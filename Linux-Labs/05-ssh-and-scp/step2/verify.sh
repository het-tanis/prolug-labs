#!/bin/bash

ORIGINAL=$(ssh node01 'cksum /etc/crontab' | awk '{print $1}')
cksum /tmp/node01.crontab | grep $ORIGINAL
