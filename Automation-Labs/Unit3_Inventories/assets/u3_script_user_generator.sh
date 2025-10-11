#!/bin/bash

#use this api https://randomuser.me/api?inc=gender,dob,nat to generate 10 random users to /root/users.txt in .csv format
# Reference: https://documenter.getpostman.com/view/19878710/2s93Jrwk3R
curl -s "https://randomuser.me/api?inc=gender,dob,nat&results=10&format=csv" > /root/users.csv 