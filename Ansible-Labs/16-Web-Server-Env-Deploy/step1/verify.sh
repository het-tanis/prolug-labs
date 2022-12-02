#!/bin/bash

curl node01:8080 | grep -iE "dev|test|qa"