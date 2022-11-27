#!/bin/bash

curl node01:8080 | grep -i dev
curl node01:8081 | grep -i test
curl node01:8082 | grep -i qa
