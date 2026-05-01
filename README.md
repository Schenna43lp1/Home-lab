# Homelab Infrastruktur-Dokumentation

Stand: 01.05.2026

Dieses Repository dokumentiert die aktuelle Homelab-Umgebung mit Proxmox-Nodes, LXC-Containern, IP-Adressen, Diensten, Backups und offenen Aufgaben.

## Inhalt

| Datei | Zweck |
|---|---|
| `docs/container-uebersicht.md` | Übersicht aller LXC-Container pro Proxmox-Node |
| `docs/ip-plan.md` | Menschlich lesbarer IP-Plan |
| `data/ip-plan.csv` | IP-Plan als CSV für Import/Weiterverarbeitung |
| `docs/dienste.md` | Dienste nach Funktion gruppiert |
| `docs/backup-monitoring.md` | Backup- und Monitoring-Übersicht |
| `docs/todos.md` | Offene Aufgaben und bekannte Probleme |
| `scripts/list-lxc-ips.sh` | Script zum Auslesen der Container-IPs auf einem Proxmox-Node |

## Proxmox Nodes

| Node | IP | Rolle |
|---|---:|---|
| pve01 | 192.168.1.11 | PBS, Uptime Kuma, MariaDB01 |
| pve02 | 192.168.1.12 | Monitoring, Web, Proxy, Git, MariaDB02 |
| pve03 | 192.168.1.13 | DNS, NetBox, MariaDB03, Proxy01, DB Backup |

## Wichtiger Hinweis

Docker-Bridge-IPs wie `172.17.0.1`, `172.18.0.1`, `172.19.0.1` usw. werden nicht im Haupt-IP-Plan geführt. Dokumentiert werden primär die echten LAN-Adressen aus `192.168.1.0/24`.

## Schnellstart

Repo klonen:

```bash
git clone <DEIN-REPO-LINK>
cd homelab-doku
```

Script ausführbar machen:

```bash
chmod +x scripts/list-lxc-ips.sh
```

Auf einem Proxmox-Node ausführen:

```bash
./scripts/list-lxc-ips.sh
```

## Pflege-Regeln

1. Neue Container immer in `docs/container-uebersicht.md` eintragen.
2. Neue IPs immer zusätzlich in `docs/ip-plan.md` und `data/ip-plan.csv` eintragen.
3. Kritische Dienste immer in `docs/dienste.md` ergänzen.
4. Backup- und Monitoring-Status in `docs/backup-monitoring.md` aktuell halten.
5. Offene Baustellen in `docs/todos.md` dokumentieren.
