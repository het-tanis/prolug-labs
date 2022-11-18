#!/bin/bash

grep baduser /var/log/* | grep "Not in sudoers"