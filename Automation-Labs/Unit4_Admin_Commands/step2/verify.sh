#!/bin/bash

curl -s node01:8082 | grep -i "fixed Version 2" >/dev/null 2>&1