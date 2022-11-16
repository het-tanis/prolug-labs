#!/bin/bash

timeout 5 ssh -o StrictHostKeyChecking=no suspect1@node01 'id'
timeout 5 ssh -o StrictHostKeyChecking=no suspect2@node01 'id'
timeout 5 ssh -o StrictHostKeyChecking=no suspect3@node01 'id'
timeout 5 ssh -o StrictHostKeyChecking=no realuser@node01 'id'