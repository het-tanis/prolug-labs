Write the four subnets that fit inside the /22.

```plain
cat >/root/subnet/plan.txt <<'EOF'
10.20.0.0/24   users
10.20.1.0/24   voice
10.20.2.0/24   servers
10.20.3.0/24   management
EOF
cat /root/subnet/plan.txt
```{{exec}}

A /22 is exactly four /24s. Keep the plan in a file; the spreadsheet is not the
design.
