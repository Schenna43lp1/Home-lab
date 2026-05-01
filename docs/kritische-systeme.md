# Kritische Systeme

Diese Datei zeigt, welche Systeme besonders wichtig sind und was bei einem Ausfall passiert.

## Kritische Dienste

| Dienst | IP | Node | Container | Ausfallwirkung |
|---|---:|---|---:|---|
| Proxmox Backup Server | 192.168.1.19 | pve01 | 100 | Keine regulären PVE-Backups / Restore eingeschränkt |
| Uptime Kuma | 192.168.1.4 | pve01 | 102 | Keine Uptime-Alarme über diesen Dienst |
| AdGuard DNS | 192.168.1.5 | pve02 | 105 | DNS-Filterung / Namensauflösung eingeschränkt |
| DNS02 / Unbound | 192.168.1.6 / 192.168.1.20 | pve03 | 104 | DNS-Redundanz / rekursive DNS-Auflösung betroffen |
| PowerDNS | 192.168.1.9 | pve03 | 106 | Interne DNS-Zonen betroffen |
| MariaDB01 | 192.168.1.60 | pve01 | 105 | DB-Cluster verliert Node 1 |
| MariaDB02 | 192.168.1.61 | pve02 | 113 | DB-Cluster verliert Node 2 |
| MariaDB03 | 192.168.1.62 | pve03 | 102 | DB-Cluster verliert Node 3 |
| proxy01 | 192.168.1.23 | pve03 | 113 | HAProxy Master betroffen |
| proxy02 | 192.168.1.24 | pve02 | 115 | HAProxy Backup betroffen |
| proxy-vip | 192.168.1.26 | pve02/pve03 | - | Webdienste über VIP nicht erreichbar |
| db-backup01 | 192.168.1.200 | pve03 | 110 | Datenbank-Backups eingeschränkt |

---

## Kritische Abhängigkeiten

| Bereich | Abhängig von | Bemerkung |
|---|---|---|
| DNS | AdGuard, dns01, PowerDNS, Unbound | Ohne DNS werden viele interne Dienste schwer erreichbar |
| Datenbanken | MariaDB01, MariaDB02, MariaDB03 | Cluster sollte mindestens 2 gesunde Nodes haben |
| Proxy / HA | proxy01, proxy02, VIP | Wichtig für zentrale Webzugriffe |
| Backup | PBS, db-backup01 | Restore-Fähigkeit regelmäßig prüfen |
| Monitoring | Uptime Kuma, docker-Monitoring, Beszel | Monitoring darf nicht nur auf einem System hängen |

---

## Priorität bei Störung

1. DNS prüfen
2. Netzwerk / Gateway prüfen
3. Proxmox-Node prüfen
4. Proxy / VIP prüfen
5. Datenbank-Cluster prüfen
6. Backup-Status prüfen
7. Monitoring prüfen
