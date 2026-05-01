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
## Übersicht

| Node | Backup-Job | Storage | Modus | Zeitplan | Status |
|---|---|---|---|---|---|
| pve01 | backup-5dd5375b-84cf | backup-01 | snapshot | täglich 21:00 | Aktiv |
| pve02 | backup-b219dc26-7b7e | pbs | snapshot | täglich 22:00 | Aktiv |
| pve03 | backup-99a0d0dd-5ca9 | pbs | snapshot | Sonntag 01:00 | Aktiv |

---

## PVE01 Backup

### Job

| Feld | Wert |
|---|---|
| Job-ID | backup-5dd5375b-84cf |
| Node | pve01 |
| Storage | backup-01 |
| Modus | snapshot |
| Zeitplan | täglich 21:00 |
| Auswahl | alle Container / VMs |
| Kompression | zstd |
| Aktiviert | Ja |

### Aufbewahrung

| Regel | Wert |
|---|---|
| keep-hourly | 2 |
| keep-daily | 1 |
| keep-weekly | 1 |
| keep-monthly | 1 |
| keep-yearly | 2 |

### Gesicherte kritische Container

| VMID | Name | Zweck | Status |
|---:|---|---|---|
| 100 | proxmox-backup-server | Proxmox Backup Server | Gesichert |
| 102 | uptimekuma | Uptime Monitoring | Gesichert |
| 105 | Mariadb01 | MariaDB Node 1 | Gesichert |

---

## PVE02 Backup

### Job

| Feld | Wert |
|---|---|
| Job-ID | backup-b219dc26-7b7e |
| Node | pve02 |
| Storage | pbs |
| Modus | snapshot |
| Zeitplan | täglich 22:00 |
| Auswahl | ausgewählte Container |
| Kompression | zstd |
| Aktiviert | Ja |

### Aufbewahrung

| Regel | Wert |
|---|---|
| keep-last | 2 |

### Gesicherte Container

| VMID | Name | Zweck | Status |
|---:|---|---|---|
| 100 | docker-Monitoring | Monitoring Stack | Gesichert |
| 101 | web-home | Interner Webserver | Gesichert |
| 102 | proxy.lab.local | Reverse Proxy | Gesichert |
| 103 | git.app.home | Git-Service | Gesichert |
| 105 | adguard | DNS Filter | Gesichert |
| 113 | mariadb02 | MariaDB Node 2 | Gesichert |
| 115 | proxy02 | HAProxy / Keepalived Backup | Gesichert |
| 116 | omada | Omada Controller | Gesichert |

### Kritische Container

| VMID | Name | Kritisch | Status |
|---:|---|---|---|
| 100 | docker-Monitoring | Ja | Gesichert |
| 102 | proxy.lab.local | Ja | Gesichert |
| 105 | adguard | Ja | Gesichert |
| 113 | mariadb02 | Ja | Gesichert |
| 115 | proxy02 | Ja | Gesichert |

---

## PVE03 Backup

### Job

| Feld | Wert |
|---|---|
| Job-ID | backup-99a0d0dd-5ca9 |
| Node | pve03 |
| Storage | pbs |
| Modus | snapshot |
| Zeitplan | Sonntag 01:00 |
| Auswahl | ausgewählte Container |
| Kompression | nicht gesetzt / Standard |
| Aktiviert | Ja |

### Aufbewahrung

Die Aufbewahrung läuft über den PBS-Prune-Job auf dem Datastore `backup`.

| Datastore | Prune-Job | Zeitplan | Aufbewahrung | Status |
|---|---|---|---|---|
| backup | default-backup-c67c3a58-b3f0-495 | täglich | keep-last=2, keep-daily=7, keep-weekly=4, keep-monthly=3 | Aktiv |

### Gesicherte Container

| VMID | Name | Zweck | Status |
|---:|---|---|---|
| 100 | beszel | Beszel Monitoring | Gesichert |
| 102 | mariadb03 | MariaDB Node 3 | Gesichert |
| 104 | dns01 | DNS02 + Unbound | Gesichert |
| 105 | mailarchive01 | Mailarchiv | Gesichert |
| 106 | dns-auth-01 | PowerDNS | Gesichert |
| 107 | netbox.app.home | NetBox / IPAM | Gesichert |
| 109 | homeassistant | Home Assistant | Gesichert |
| 110 | db-backup01 | Datenbank Backup Server | Gesichert |
| 113 | proxy01 | HAProxy Master + VIP | Gesichert |

### Kritische Container

| VMID | Name | Kritisch | Status |
|---:|---|---|---|
| 102 | mariadb03 | Ja | Gesichert |
| 104 | dns01 | Ja | Gesichert |
| 106 | dns-auth-01 | Ja | Gesichert |
| 107 | netbox.app.home | Ja | Gesichert |
| 110 | db-backup01 | Ja | Gesichert |
| 113 | proxy01 | Ja | Gesichert |

---

## PBS Retention

| Datastore | Prune-Job | Zeitplan | Aufbewahrung |
|---|---|---|---|
| backup | default-backup-c67c3a58-b3f0-495 | täglich | keep-last=2, keep-daily=7, keep-weekly=4, keep-monthly=3 |

---

## Bewertung

| Node | Bewertung |
|---|---|
| pve01 | OK, alle Container werden gesichert |
| pve02 | OK, kritische Container inklusive `proxy02` werden gesichert |
| pve03 | OK, kritische Container inklusive `netbox.app.home` und `proxy01` werden gesichert |

---

## Offene Punkte

| Aufgabe | Status |
|---|---|
| Backup-Jobs für kritische Container prüfen | Erledigt |
| pve02 CT115 `proxy02` zum Backup hinzufügen | Erledigt |
| pve03 CT107 `netbox.app.home` zum Backup hinzufügen | Erledigt |
| pve03 CT113 `proxy01` zum Backup hinzufügen | Erledigt |
| pve03 Retention am PBS-Datastore prüfen | Erledigt |
| PBS-Retention verbessern | Erledigt |
| Regelmäßigen Restore-Test durchführen | Offen |

---

## Nützliche Befehle

### Backup-Jobs anzeigen

```bash
cat /etc/pve/jobs.cfg