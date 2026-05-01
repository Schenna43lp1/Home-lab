# Betrieb & Befehle

Nützliche Befehle für die tägliche Verwaltung.

---

## LXC-Container anzeigen

```bash
pct list
```

## Container-Konfiguration anzeigen

```bash
pct config <VMID>
```

Beispiel:

```bash
pct config 113
```

## IP eines Containers anzeigen

```bash
pct exec <VMID> -- hostname -I
```

Beispiel:

```bash
pct exec 113 -- hostname -I
```

## Container starten / stoppen / neustarten

```bash
pct start <VMID>
pct stop <VMID>
pct restart <VMID>
```

## Container entsperren

Nur verwenden, wenn wirklich kein Backup/Task mehr läuft.

```bash
pct unlock <VMID>
```

## Laufende Backup-Prozesse prüfen

```bash
ps aux | grep vzdump
```

## IP-Konflikte suchen

Auf einem Proxmox-Node:

```bash
./scripts/list-lxc-ips.sh
```

Oder manuell:

```bash
for vmid in $(pct list | awk 'NR>1 {print $1}'); do
  echo "CT $vmid"
  pct exec "$vmid" -- hostname -I 2>/dev/null
done
```

## Git-Doku aktualisieren

```bash
git status
git add .
git commit -m "Update homelab documentation"
git push
```

## Gute Commit-Namen

```text
Update IP plan
Add new container
Fix node documentation
Update backup status
Document DNS changes
```
