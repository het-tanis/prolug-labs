#!/bin/bash

timeout 1 nc -vz node01 40200; if [ $? == 124 ]; then echo "passed"; fi