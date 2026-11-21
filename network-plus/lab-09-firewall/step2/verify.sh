#!/bin/bash
if curl -s --max-time 2 http://127.0.0.1:8080 >/dev/null 2>&1; then
  echo "8080 still answers despite the drop rule"; exit 1
fi
echo "service blocked"
