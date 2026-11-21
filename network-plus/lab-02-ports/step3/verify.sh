#!/bin/bash
if ss -tulpn | grep -qE ':(8080|9090)'; then
  echo "a test service is still listening"; exit 1
fi
echo "services stopped"
