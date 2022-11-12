#!/bin/bash

ssh node01 'systemctl is-enabled kubelet' && ssh node01 'systemctl is-active kubelet'