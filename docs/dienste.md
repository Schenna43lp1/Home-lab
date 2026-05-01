# Dienste nach Funktion

## DNS

| Dienst | IP | Node | Container |
|---|---:|---|---|
| AdGuard Primary | 192.168.1.5 | pve02 | CT 105 |
| DNS02 | 192.168.1.6 | pve03 | CT 104 |
| Unbound DNS | 192.168.1.20 | pve03 | CT 104 |
| PowerDNS | 192.168.1.9 | pve03 | CT 106 |

## Datenbanken

| Dienst | IP | Node | Container |
|---|---:|---|---|
| MariaDB01 | 192.168.1.60 | pve01 | CT 105 |
| MariaDB02 | 192.168.1.61 | pve02 | CT 113 |
| MariaDB03 | 192.168.1.62 | pve03 | CT 102 |
| DB Backup | 192.168.1.200 | pve03 | CT 110 |

## Proxy / HA

| Dienst | IP | Node | Container |
|---|---:|---|---|
| Reverse Proxy | 192.168.1.22 | pve02 | CT 102 |
| proxy01 | 192.168.1.23 | pve03 | CT 113 |
| proxy02 | 192.168.1.24 | pve02 | CT 115 |
| VIP | 192.168.1.26 | aktiv auf Master | Keepalived |
| HAProxy-WI | 192.168.1.28 | pve02 | CT 117 |

## Monitoring

| Dienst | IP | Node | Container |
|---|---:|---|---|
| Uptime Kuma | 192.168.1.4 | pve01 | CT 102 |
| docker-Monitoring | 192.168.1.21 | pve02 | CT 100 |
| Patchmon | 192.168.1.79 | pve03 | CT 101 |
| Beszel | 192.168.1.170 | pve03 | CT 100 |

## Management / Tools

| Dienst | IP | Node | Container |
|---|---:|---|---|
| NetBox | 192.168.1.25 | pve03 | CT 107 |
| Git | 192.168.1.31 | pve02 | CT 103 |
| ansible/Semaphore | 192.168.1.44 | pve02 | CT 104 |
| Proxmox Datacenter Manager | 192.168.1.92 | pve02 | CT 108 |
| Omada Controller | 192.168.1.189 | pve02 | CT 116 |
