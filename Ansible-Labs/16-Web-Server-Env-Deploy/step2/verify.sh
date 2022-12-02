#!/bin/bash

curl node01:8081; if [ $? == 1 ]; then echo "passed"; fi