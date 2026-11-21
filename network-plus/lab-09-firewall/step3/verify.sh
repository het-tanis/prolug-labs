#!/bin/bash
sshd -t >/dev/null 2>&1 || { echo "sshd configuration is invalid"; exit 1; }
sshd -T 2>/dev/null | grep -qi '^permitrootlogin no' || { echo "root login not disabled"; exit 1; }
sshd -T 2>/dev/null | grep -qi '^passwordauthentication no' || { echo "password auth not disabled"; exit 1; }
echo "sshd hardened"
