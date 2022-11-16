#!/bin/bash

ssh -o StrictHostKeyChecking=no -i /root/.ssh/realuser_rsa realuser@node01 'id'