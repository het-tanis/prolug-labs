#!/bin/bash

kafkacat -C -b node01:31000 -t test | grep message