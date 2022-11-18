#!/bin/bash

grep baduser /var/log/* | grep "NOT in sudoers"