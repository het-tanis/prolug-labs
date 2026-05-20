Welcome.

You are about to build a **complete observability stack on one Ubuntu machine** - by hand, from the terminal. No Ansible, no automation: just packages, config files, and `systemctl`.

<br>

## The old way vs Alloy

| Task | Older approach (separate tools) | This lab (Alloy) |
|------|--------------------------------|------------------|
| Host metrics | Node Exporter + Prometheus scrape | Alloy `prometheus.exporter.unix` + remote write |
| Logs | Promtail → Loki | Alloy `loki.source.*` → Loki |
| Config files | Multiple formats | One `config.alloy` (River syntax) |

<br>

## Lab roadmap (5 steps)

1. **Grafana + Loki** - UI and log storage  
2. **Prometheus** - metric storage (with remote-write receiver for Alloy)  
3. **Install Alloy** - package and permissions  
4. **Configure Alloy** - wire metrics and logs in `config.alloy`  
5. **Verify in Grafana** - prove data flows end to end  

<br>

## What you will use on Ubuntu

- `apt` and the Grafana package repository  
- `systemctl` for services  
- `/etc/alloy/config.alloy` for the agent pipeline  
- Ubuntu log paths: `/var/log/syslog`, `/var/log/auth.log`, plus the systemd journal  

<br>

## Lab config files and `/answers`

Several steps say to copy files **from `/answers`**. That is intentional - not a normal Ubuntu system directory you create by hand.

| Location | What it is |
|----------|------------|
| **`/answers/`** on the lab VM | Staging folder for **reference configs** (Prometheus unit file, Loki config, `config.alloy`, etc.) |
| **`assets/`** in this lab repo | Source copies of those same files (for authors and KillerCoda) |
| **`/etc/...`** | Where files belong **after** you copy them - real service configuration |

In **KillerCoda**, the scenario copies everything from this lab’s `assets/` folder onto the VM at **`/answers`** before you start. Your job in the steps is to **`cp`** from there into the correct system paths (for example `/etc/prometheus/prometheus.yml`).

**Running outside KillerCoda?** Create the folder and seed it yourself:

```bash
sudo mkdir -p /answers
sudo cp assets/* /answers/
```

Then use the same `cp /answers/...` commands as in the steps.

Take your time on step 4 - that is where the pieces connect. Steps 1-3 prepare the destinations; step 5 proves everything works.
