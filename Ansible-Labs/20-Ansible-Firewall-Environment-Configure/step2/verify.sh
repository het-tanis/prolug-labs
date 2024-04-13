#!/bin/bash

if ! timeout 1 nc -vz node01 40200; then echo "passed"; fi