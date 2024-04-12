#!/bin/bash

timeout 3 nc -vz node01 40200; if [ $? == 1 ]; then echo "passed"; fi