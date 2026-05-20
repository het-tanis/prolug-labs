#!/bin/bash
systemctl is-active grafana-server prometheus alloy loki.service >/dev/null \
  && curl -sf http://127.0.0.1:9090/-/healthy >/dev/null \
  && curl -sf http://127.0.0.1:3100/ready >/dev/null
