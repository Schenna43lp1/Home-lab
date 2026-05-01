# IP-Plan

Netzbereich: `192.168.1.0/24`

## Core / Netzwerk / DNS

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.1 | Router | - | - | Gateway |
| 192.168.1.4 | uptimekuma | pve01 | 102 | Uptime Monitoring |
| 192.168.1.5 | adguard | pve02 | 105 | AdGuard DNS |
| 192.168.1.6 | dns01 | pve03 | 104 | DNS02 |
| 192.168.1.9 | dns-auth-01 | pve03 | 106 | PowerDNS |
| 192.168.1.20 | dns01 | pve03 | 104 | Unbound DNS |

## Proxmox / Infrastruktur

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.11 | pve01 | - | - | Proxmox Node |
| 192.168.1.12 | pve02 | - | - | Proxmox Node |
| 192.168.1.13 | pve03 | - | - | Proxmox Node |
| 192.168.1.19 | proxmox-backup-server | pve01 | 100 | PBS |
| 192.168.1.25 | netbox.app.home | pve03 | 107 | NetBox |

## Proxy / HA

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.22 | proxy.lab.local | pve02 | 102 | Reverse Proxy |
| 192.168.1.23 | proxy01 | pve03 | 113 | HAProxy Master |
| 192.168.1.24 | proxy02 | pve02 | 115 | HAProxy Backup |
| 192.168.1.26 | proxy-vip | pve02/pve03 | - | Keepalived VIP |
| 192.168.1.28 | proxy-wi-01 | pve02 | 117 | HAProxy-WI |

## Web / Apps / Dev

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.30 | web-home | pve02 | 101 | Webserver |
| 192.168.1.31 | git.app.home | pve02 | 103 | Git |
| 192.168.1.44 | asible | pve02 | 104 | Ansible / Semaphore |
| 192.168.1.69 | admiral | pve03 | 103 | Web/App |
| 192.168.1.82 | termix | pve02 | 111 | Web-Terminal |
| 192.168.1.91 | de | pve02 | 109 | Unklar |
| 192.168.1.92 | proxmox-datacenter-manager | pve02 | 108 | PDM |
| 192.168.1.125 | mailarchive01 | pve03 | 105 | Mailarchiv |

## Datenbanken / Backup

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.60 | Mariadb01 | pve01 | 105 | MariaDB Node 1 |
| 192.168.1.61 | mariadb02 | pve02 | 113 | MariaDB Node 2 |
| 192.168.1.62 | mariadb03 | pve03 | 102 | MariaDB Node 3 |
| 192.168.1.200 | db-backup01 | pve03 | 110 | DB Backup Server |

## Monitoring / Management / Smart Home

| IP | Hostname | Node | VMID | Dienst |
|---:|---|---|---:|---|
| 192.168.1.18 | homeassistant | pve03 | 109 | Home Assistant |
| 192.168.1.21 | docker-Monitoring | pve02 | 100 | Monitoring Stack |
| 192.168.1.79 | patchmon | pve03 | 101 | Patch Monitoring |
| 192.168.1.170 | beszel | pve03 | 100 | Beszel |
| 192.168.1.189 | omada | pve02 | 116 | Omada Controller |

## Bekannte Konflikte

| IP | Konflikt |
|---:|---|
| 192.168.1.61 | Wird aktuell von `nodjs-dev` und `mariadb02` angezeigt. Prüfen und `nodjs-dev` auf freie IP ändern. |
