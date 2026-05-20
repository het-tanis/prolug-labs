# Grafana Alloy lab

**Platform:** Ubuntu

## KillerCoda `/answers` convention

Steps reference **`/answers/`** on the lab host. That path is defined in `index.json` under `assets` - each file in `assets/` is copied to `/answers` when the scenario starts. Learners copy from `/answers` into `/etc/...` during the lab. See **`intro.md`** for the full explanation shown to students.

## Contents

Each step includes **explainer sections** (what / why / what to expect) before the collapsible solution commands.

| Step | Topic |
|------|--------|
| 1 | Grafana + Loki (APT / binaries on Ubuntu) |
| 2 | Prometheus with remote-write receiver |
| 3 | Install Alloy from Grafana APT repo |
| 4 | `/etc/alloy/config.alloy` - metrics + logs |
| 5 | Verify in Grafana |

## Ubuntu log paths

- `/var/log/syslog`, `/var/log/auth.log` (not RHEL `/var/log/secure`)
- `systemd-journal` group membership for the `alloy` user
