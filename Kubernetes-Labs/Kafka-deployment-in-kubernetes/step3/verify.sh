#!/bin/bash

timeout 3 kcat -C -b node01:31000 -t test | grep message