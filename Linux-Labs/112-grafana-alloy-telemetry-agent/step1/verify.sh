#!/bin/bash
systemctl is-active grafana-server && systemctl is-active loki.service
