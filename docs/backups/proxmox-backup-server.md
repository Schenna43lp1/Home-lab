# Proxmox Backup Server

Stand: 02.05.2026

## System

| Feld | Wert |
|---|---|
| Hostname | `proxmox-backup-server` |
| IP | `192.168.1.19` |
| Typ | LXC Container |
| OS | Debian GNU/Linux 13 |
| Zweck | Zentrale Backup-Instanz für Proxmox VE |

## Backup-Architektur

```text
PVE Nodes → PBS Local Datastore → PBS S3 Datastore → Backblaze B2