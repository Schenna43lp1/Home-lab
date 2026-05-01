# Container-Übersicht

Stand: 01.05.2026

## PVE01 - 192.168.1.11

| VMID | Name | Status | IP | Zweck |
|---:|---|---|---|---|
| 100 | proxmox-backup-server | running | 192.168.1.19 | Proxmox Backup Server |
| 102 | uptimekuma | running | 192.168.1.4 | Uptime Monitoring |
| 105 | Mariadb01 | running | 192.168.1.60 | MariaDB Node 1 |

## PVE02 - 192.168.1.12

| VMID | Name | Status | IP | Zweck |
|---:|---|---|---|---|
| 100 | docker-Monitoring | running | 192.168.1.21 | Monitoring / Docker |
| 101 | web-home | running | 192.168.1.30 | Interner Webserver |
| 102 | proxy.lab.local | running | 192.168.1.22 | Reverse Proxy |
| 103 | git.app.home | running | 192.168.1.31 | Git-Service |
| 104 | asible | running | 192.168.1.44 | Ansible / Semaphore |
| 105 | adguard | running | 192.168.1.5 | DNS Filter |
| 106 | web01 | stopped | stopped | Webserver |
| 107 | nt-monitoring | stopped | stopped | Monitoring-Test |
| 108 | proxmox-datacenter-manager | running | 192.168.1.92 | Proxmox Datacenter Manager |
| 109 | de | running | 192.168.1.91 | Unklar |
| 110 | nodjs-dev | running | 192.168.1.61 | Node.js Dev, IP-Konflikt prüfen |
| 111 | termix | running | 192.168.1.82 | Web-Terminal / SSH |
| 112 | minio | stopped | stopped | Object Storage |
| 113 | mariadb02 | running | 192.168.1.61 | MariaDB Node 2 |
| 115 | proxy02 | running | 192.168.1.24 | HAProxy / Keepalived Backup |
| 116 | omada | running | 192.168.1.189 | Omada Controller |
| 117 | proxy-wi-01 | running | 192.168.1.28 | HAProxy-WI |

## PVE03 - 192.168.1.13

| VMID | Name | Status | IP | Zweck |
|---:|---|---|---|---|
| 100 | beszel | running | 192.168.1.170 | Beszel Monitoring |
| 101 | patchmon | running | 192.168.1.79 | Patch-/Update-Monitoring |
| 102 | mariadb03 | running | 192.168.1.62 | MariaDB Node 3 |
| 103 | admiral | running | 192.168.1.69 | Web/App-Server |
| 104 | dns01 | running | 192.168.1.6 / 192.168.1.20 | DNS02 + Unbound |
| 105 | mailarchive01 | running | 192.168.1.125 | Mailarchiv |
| 106 | dns-auth-01 | running | 192.168.1.9 | PowerDNS |
| 107 | netbox.app.home | running | 192.168.1.25 | NetBox |
| 109 | homeassistant | running | 192.168.1.18 | Home Assistant |
| 110 | db-backup01 | running | 192.168.1.200 | DB Backup Server |
| 111 | apps01 | stopped | stopped | App-Server |
| 112 | test-db | stopped | stopped | Test-Datenbank |
| 113 | proxy01 | running | 192.168.1.23 / 192.168.1.26 | HAProxy Master + VIP |
| 115 | proxy-wi-dev | stopped | stopped | HAProxy-WI Dev |
