# Backup & Monitoring

## Backup-Ziele

| System | IP | Zweck |
|---|---:|---|
| proxmox-backup-server | 192.168.1.19 | Proxmox Backup Server |
| db-backup01 | 192.168.1.200 | Datenbank-Backups |

## Kritische Container für Backup

| Container | Node | VMID | Priorität |
|---|---|---:|---|
| proxmox-backup-server | pve01 | 100 | Hoch |
| Mariadb01 | pve01 | 105 | Hoch |
| mariadb02 | pve02 | 113 | Hoch |
| mariadb03 | pve03 | 102 | Hoch |
| db-backup01 | pve03 | 110 | Hoch |
| adguard | pve02 | 105 | Hoch |
| dns01 | pve03 | 104 | Hoch |
| dns-auth-01 | pve03 | 106 | Hoch |
| proxy01 | pve03 | 113 | Hoch |
| proxy02 | pve02 | 115 | Hoch |
| netbox.app.home | pve03 | 107 | Mittel |
| git.app.home | pve02 | 103 | Mittel |

## Monitoring-Checks

Mindestens überwachen:

- Ping
- HTTP/HTTPS
- SSH
- DNS-Port 53
- MariaDB-Port 3306
- HAProxy Stats
- Speicherplatz
- CPU/RAM
- Zertifikatsablauf
- Backup-Job-Status

## Empfehlung

Für jeden kritischen Dienst in Uptime Kuma einen eigenen Check anlegen. Zusätzlich sollten MariaDB und Proxmox über den Monitoring-Stack auf `192.168.1.21` überwacht werden.
## Backup-Prüfung

Stand: 01.05.2026

| Node | Ergebnis |
|---|---|
| pve01 | OK, alle Container im Backup-Job |
| pve02 | OK, kritische Container inkl. `proxy02` im Backup |
| pve03 | OK, kritische Container inkl. `netbox.app.home` und `proxy01` im Backup |
