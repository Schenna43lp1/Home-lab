# Proxmox Backup Server Datastore Sync

Stand: 02.05.2026

## Ziel

Die Backups werden zuerst lokal auf PBS gespeichert und danach in den Backblaze-B2-S3-Datastore synchronisiert.

## Architektur

```text
PVE Nodes
   ↓
PBS Local Datastore
   ↓ Sync Job
PBS S3 Datastore
   ↓
Backblaze B2