# Homelab-Dokumentation

Stand: 01.05.2026  
Netz: `192.168.1.0/24`

Dieses Repository ist die zentrale Dokumentation für das Homelab.  
Ziel: Schnell sehen, **welcher Dienst wo läuft**, welche IP genutzt wird und welche Systeme kritisch sind.

---

## Schnellübersicht

| Bereich | Systeme |
|---|---|
| Virtualisierung | pve01, pve02, pve03 |
| DNS | AdGuard, DNS02, Unbound, PowerDNS |
| Monitoring | Uptime Kuma, docker-Monitoring, Beszel, Patchmon |
| Datenbanken | MariaDB01, MariaDB02, MariaDB03 |
| Backup | Proxmox Backup Server, db-backup01 |
| Proxy / HA | proxy01, proxy02, Keepalived VIP, Reverse Proxy |
| Management | NetBox, Omada, Proxmox Datacenter Manager, Git, Ansible |

---

## Proxmox Nodes

| Node | IP | Hauptrolle | Kritische Dienste |
|---|---:|---|---|
| pve01 | 192.168.1.11 | Backup / Datenbank | PBS, Uptime Kuma, MariaDB01 |
| pve02 | 192.168.1.12 | Services / Management | Monitoring, Web, Git, AdGuard, MariaDB02, proxy02 |
| pve03 | 192.168.1.13 | Infrastruktur / DNS / HA | PowerDNS, NetBox, MariaDB03, proxy01, DB Backup |

---

## Wichtigste Dateien

| Datei | Beschreibung |
|---|---|
| `docs/container-uebersicht.md` | Alle LXC-Container nach Proxmox-Node |
| `docs/ip-plan.md` | IP-Plan als Markdown |
| `data/ip-plan.csv` | IP-Plan als CSV |
| `docs/dienste.md` | Dienste nach Funktion gruppiert |
| `docs/kritische-systeme.md` | Kritische Systeme und Ausfallwirkung |
| `docs/backup-monitoring.md` | Backup- und Monitoring-Status |
| `docs/betrieb.md` | Nützliche Betriebsbefehle |
| `docs/todos.md` | Offene Aufgaben |
| `docs/changelog.md` | Änderungen an der Dokumentation |
| `scripts/list-lxc-ips.sh` | Script zum Auslesen von LXC-IP-Adressen |

---

## Legende

| Begriff | Bedeutung |
|---|---|
| `running` | Container läuft |
| `stopped` | Container ist gestoppt |
| `kritisch` | Ausfall betrifft wichtige Homelab-Funktionen |
| `VIP` | Virtuelle IP, meistens durch Keepalived |
| `Docker-IP` | Interne Docker-Bridge-IP, nicht im Haupt-IP-Plan führen |

---

## Wichtige Regeln

1. **Jede LAN-IP darf nur einmal vergeben sein.**
2. **Docker-Bridge-IPs wie `172.17.0.1` werden nicht im Haupt-IP-Plan geführt.**
3. Neue Container immer in `docs/container-uebersicht.md` eintragen.
4. Neue IPs immer in `docs/ip-plan.md` und `data/ip-plan.csv` eintragen.
5. Kritische Dienste zusätzlich in `docs/kritische-systeme.md` dokumentieren.
6. Änderungen kurz in `docs/changelog.md` eintragen.

---

## Aktueller Hinweis

Der frühere IP-Konflikt zwischen `nodjs-dev` und `mariadb02` auf `192.168.1.61` wurde als erledigt markiert.  
Die neue IP von `nodjs-dev` sollte noch sauber in `docs/ip-plan.md` und `data/ip-plan.csv` eingetragen werden, falls noch nicht erledigt.

---

## Repo aktualisieren

```bash
git add .
git commit -m "Update homelab documentation"
git push
```
