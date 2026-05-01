# Container-Übersicht

Stand: 01.05.2026

Diese Datei zeigt, welcher LXC-Container auf welchem Proxmox-Node läuft.

> Hinweis: Docker-Bridge-IPs wie `172.17.0.1`, `172.18.0.1` usw. werden hier bewusst nicht geführt.

---

## PVE01 - 192.168.1.11

| VMID | Name | Status | LAN-IP | Zweck | Kritisch |
|---:|---|---|---|---|---|
| 100 | proxmox-backup-server | running | 192.168.1.19 | Proxmox Backup Server | Ja |
| 102 | uptimekuma | running | 192.168.1.4 | Uptime Monitoring | Ja |
| 105 | Mariadb01 | running | 192.168.1.60 | MariaDB Node 1 | Ja |

---

## PVE02 - 192.168.1.12

| VMID | Name | Status | LAN-IP | Zweck | Kritisch |
|---:|---|---|---|---|---|
| 100 | docker-Monitoring | running | 192.168.1.21 | Monitoring / Docker | Ja |
| 101 | web-home | running | 192.168.1.30 | Interner Webserver | Mittel |
| 102 | proxy.lab.local | running | 192.168.1.22 | Reverse Proxy | Ja |
| 103 | git.app.home | running | 192.168.1.31 | Git-Service | Mittel |
| 104 | asible | running | 192.168.1.44 | Ansible / Semaphore | Mittel |
| 105 | adguard | running | 192.168.1.5 | DNS Filter | Ja |
| 106 | web01 | stopped | - | Webserver | Nein |
| 107 | nt-monitoring | stopped | - | Monitoring-Test | Nein |
| 108 | proxmox-datacenter-manager | running | 192.168.1.92 | Proxmox Datacenter Manager | Mittel |
| 109 | de | running | 192.168.1.91 | Zweck unklar | Nein |
| 110 | nodjs-dev | running | IP nachtragen | Node.js Dev | Nein |
| 111 | termix | running | 192.168.1.82 | Web-Terminal / SSH | Mittel |
| 112 | minio | stopped | - | Object Storage | Nein |
| 113 | mariadb02 | running | 192.168.1.61 | MariaDB Node 2 | Ja |
| 115 | proxy02 | running | 192.168.1.24 | HAProxy / Keepalived Backup | Ja |
| 116 | omada | running | 192.168.1.189 | Omada Controller | Mittel |
| 117 | proxy-wi-01 | running | 192.168.1.28 | HAProxy-WI | Mittel |

---

## PVE03 - 192.168.1.13

| VMID | Name | Status | LAN-IP | Zweck | Kritisch |
|---:|---|---|---|---|---|
| 100 | beszel | running | 192.168.1.170 | Beszel Monitoring | Mittel |
| 101 | patchmon | running | 192.168.1.79 | Patch-/Update-Monitoring | Mittel |
| 102 | mariadb03 | running | 192.168.1.62 | MariaDB Node 3 | Ja |
| 103 | admiral | running | 192.168.1.69 | Web/App-Server | Mittel |
| 104 | dns01 | running | 192.168.1.6 / 192.168.1.20 | DNS02 + Unbound | Ja |
| 105 | mailarchive01 | running | 192.168.1.125 | Mailarchiv | Mittel |
| 106 | dns-auth-01 | running | 192.168.1.9 | PowerDNS | Ja |
| 107 | netbox.app.home | running | 192.168.1.25 | NetBox | Mittel |
| 109 | homeassistant | running | 192.168.1.18 | Home Assistant | Mittel |
| 110 | db-backup01 | running | 192.168.1.200 | DB Backup Server | Ja |
| 111 | apps01 | stopped | - | App-Server | Nein |
| 112 | test-db | stopped | - | Test-Datenbank | Nein |
| 113 | proxy01 | running | 192.168.1.23 / 192.168.1.26 | HAProxy Master + VIP | Ja |
| 115 | proxy-wi-dev | stopped | - | HAProxy-WI Dev | Nein |
