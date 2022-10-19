#!/bin/bash


ansible servers -i /root/hosts -m shell -a 'grep 111111 /opt/deployment/configfile.cfg'