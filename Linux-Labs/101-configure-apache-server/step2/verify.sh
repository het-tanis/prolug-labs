#!/bin/bash

curl node01:8080 | grep dev
curl node01:8081 | grep test
curl node01:8082 | grep qa
