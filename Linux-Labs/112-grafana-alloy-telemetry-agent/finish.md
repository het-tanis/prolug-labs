## Look at you, learning all the Linux!

On a single **Ubuntu** host you built a working observability stack:

- **Grafana** for exploration and dashboards  
- **Prometheus** receiving metrics pushed by Alloy  
- **Loki** receiving logs pushed by Alloy  
- **Alloy** as the one agent collecting and forwarding everything  

That is the same *architecture* many production environments use - you just assembled it manually so you know what each file and service actually does.

<br>

## Concepts worth remembering

| Idea | Takeaway |
|------|----------|
| **Push vs scrape** | Alloy *pushes* metrics; classic Node Exporter setups are *scraped* |
| **River config** | Alloy pipelines are declared in `config.alloy`, not in Prometheus YAML |
| **Ubuntu logs** | `auth.log` + `syslog` + journal - paths differ on RHEL (`secure` instead of `auth.log`) |
| **Permissions** | `alloy` needs `systemd-journal` group membership for journal logs |

<br>

## Where to go from here

- Add labels (`hostname`, `env`, `role`) in `config.alloy` for easier filtering  
- Point remote_write and `loki.write` at remote servers instead of `127.0.0.1`  
- Explore OTLP traces or eBPF profiling in Alloy docs when you are ready  

Thank you for working through the stack step by step.


---

This lab was contributed by ProLUG member Shane Dugas (Zorgul)

Join ProLUG on [Discord](https://discord.com/invite/m6VPPD9usw).

