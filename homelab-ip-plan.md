---
title: Homelab IP-Plan
author: Markus Stuefer
description: Netzwerkübersicht des Homelab 192.168.1.0/24
last_updated: 2025-10-31
---

# 🌐 Homelab Netzwerkübersicht — 192.168.1.0/24

| IP-Adresse        | Hostname             | Beschreibung              | Status            |
|--------------------|----------------------|----------------------------|-------------------|
| 192.168.1.1        | router               | Gateway / Internetzugang   | ✅ aktiv |
| 192.168.1.4        | uptimekuma02         | Monitoring (Uptime Kuma)   | ✅ aktiv |
| 192.168.1.5        | adguard              | DNS / Adblock (AdGuard)    | ✅ aktiv |
| 192.168.1.9        | homer                | Dashboard (Homer)          | ✅ aktiv |
| 192.168.1.11       | pve01                | Proxmox Node 1             | ✅ aktiv |
| 192.168.1.12       | pve02                | Proxmox Node 2             | ✅ aktiv |
| 192.168.1.15       | sw01                 | Switch Core                | ✅ aktiv |
| 192.168.1.19       | —                    | Autodiscovered             | ⚠️ unbekannt |
| 192.168.1.20       | docker-core-dns          | Core Docker DNS           | ✅ aktiv |
| 192.168.1.21       | docker-monitoring    | Monitoring Stack           | ✅ aktiv |
| 192.168.1.22       | reverse-proxy        | Reverse Proxy (Zoraxy/Nginx) | ✅ aktiv |
| 192.168.1.25       | wazuh                | Security / SIEM (Wazuh)    | ✅ aktiv |
| 192.168.1.30       | web-home             | Webserver (Home / Prod)    | ✅ aktiv |
| 192.168.1.31       | git-lxc              | Git / Forgejo LXC          | ✅ aktiv |
| 192.168.1.36       | —                    | Autodiscovered             | ⚠️ unbekannt |
| 192.168.1.44       | ansible              | Automatisierung (Ansible)  | ✅ aktiv |
| 192.168.1.45       | docker01             | Experimentelle Container   | ✅ aktiv |
| 192.168.1.46       | idk                  | Unbekannt / Testsystem     | ⚠️ prüfen |
| 192.168.1.47–.53   | —                    | Frei / Reserviert (7 IPs)  | 🟡 frei |
| 192.168.1.54       | sw02                 | Switch Secondary           | ✅ aktiv |
| 192.168.1.55–.60   | —                    | Frei / Reserviert (6 IPs)  | 🟡 frei |
| 192.168.1.61       | nodejs-dev           | Entwicklungsserver (Node.js) | ✅ aktiv |
| 192.168.1.62–.69   | —                    | Frei / Reserviert (8 IPs)  | 🟡 frei |
| 192.168.1.70       | influxdb             | Zeitreihendatenbank (InfluxDB) | ✅ aktiv |
| 192.168.1.71       | grafana              | Dashboard (Grafana)        | ✅ aktiv |
| 192.168.1.79       | hue01                | Smart Home (Philips Hue)   | ✅ aktiv |
| 192.168.1.88       | pdm                  | PDM / Device Management    | ✅ aktiv |
| 192.168.1.98–.107  | —                    | Autodiscovered (mehrere)   | ⚠️ prüfen |
| 192.168.1.131      | markus-pc            | Hauptarbeitsplatz          | ✅ aktiv |
| 192.168.1.175      | —                    | Autodiscovered             | ⚠️ unbekannt |
| 192.168.1.177      | nas01                | Storage / NAS              | ✅ aktiv |
| 192.168.1.180      | —                    | Autodiscovered             | ⚠️ unbekannt |
| 192.168.1.187      | —                    | Autodiscovered             | ⚠️ unbekannt |

---

### 📡 Netzwerkdetails

| Eigenschaft | Wert |
|-------------|------|
| **Subnetz** | 192.168.1.0/24 |
| **Netzmaske** | 255.255.255.0 |
| **Gateway** | 192.168.1.1 |
| **Broadcast** | 192.168.1.255 |
| **Verfügbare Hosts** | 254 |
| **DNS01**| 192.168.1.20 |
| **DNS02** | 192.168.1.5 (AdGuard) |

---

> 💡 **Tipp:**  
> Du kannst diese Datei direkt im Repository anzeigen lassen oder über `README.md` verlinken, z. B.:  
> ```markdown
> [🌐 Homelab IP-Plan](homelab-ip-plan.md)
> ```
