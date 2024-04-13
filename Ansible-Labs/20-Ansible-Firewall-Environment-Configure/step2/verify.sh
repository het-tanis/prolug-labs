#!/bin/bash

a=$?; nc node01 40800; if [ $a == 0 ]; then echo "passed"; fi