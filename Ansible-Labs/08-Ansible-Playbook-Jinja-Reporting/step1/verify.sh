#!/bin/bash

/usr/bin/ansible servers -i /root/hosts -m shell -a 'ls -l /root/template.txt'