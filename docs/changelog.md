# Changelog

## 01.05.2026

### Hinzugefügt

- Verbesserte README mit Schnellübersicht.
- Neue Datei `docs/kritische-systeme.md`.
- Neue Datei `docs/betrieb.md`.
- Bessere Container-Tabelle mit Kritisch-Spalte.
- To-do-Liste verbessert.

### Geändert

- IP-Konflikt `nodjs-dev` / `mariadb02` als gelöst markiert.
- Docker-Bridge-IPs werden klar aus dem Haupt-IP-Plan ausgeschlossen.
- Neue IP von `nodjs-dev` nachtragen.
- Container `asible` umbenennen.

### Offen
- Container `de` klären.

## Stand: 02.05.2026
### MariaDB-Erreichbarkeit geprüft

| Node | IP | Ping | Port 3306 |
|---|---:|---|---|
| mariadb01 | 192.168.1.60 | OK | offen |
| mariadb02 | 192.168.1.61 | OK | offen |
| mariadb03 | 192.168.1.62 | OK | offen |

Hinweis: Reverse DNS/PTR ist nicht gesetzt, daher erscheint bei `nc` die Meldung `inverse host lookup failed`. Das ist für die Erreichbarkeit nicht kritisch.

### Backup-Prüfung


| Node | Backup-Job | Storage | Ergebnis |
|---|---|---|---|
| pve01 | backup-5dd5375b-84cf | backup-01 | OK, all 1 |
| pve02 | backup-b219dc26-7b7e | pbs | Fast OK, CT115 proxy02 fehlt |
| pve03 | backup-99a0d0dd-5ca9 | pbs | Fast OK, CT107 NetBox und CT113 proxy01 fehlen |

Offen:
- [x] pve02 CT115 `proxy02` zum Backup hinzugefügt
- [x] pve03 CT107 `netbox.app.home` zum Backup hinzugefügt
- [x] pve03 CT113 `proxy01` zum Backup hinzugefügt
Stand: 02.05.2026

## DNS-Infrastruktur

### dns-auth-01

- IP: 192.168.1.9
- Rolle: PowerDNS Primary / Master
- Betrieb: Docker
- Container: powerdns
- Web-GUI: PowerDNS-Admin
- PowerDNS-Admin URL: http://192.168.1.9:9191
- PowerDNS API: Port 8081
- DNS Ports: TCP/UDP 53
- Datenbank: MariaDB Cluster/VIP 192.168.1.26
- Status: aktiv

### dns-auth-02

- IP: 192.168.1.8
- Rolle: PowerDNS Secondary
- Betrieb: native PowerDNS-Installation
- Datenbank: lokale MariaDB
- Sync-Methode: AXFR von dns-auth-01
- Primary: 192.168.1.9
- Status: aktiv

## Durchgeführte Änderungen

- dns-auth-01 läuft erfolgreich als Docker-Container.
- PowerDNS-Admin läuft erfolgreich auf Port 9191.
- PowerDNS-Admin wurde beschleunigt/repariert.
- home.app wurde von Native auf Primary/Master gesetzt.
- dns-auth-02 wurde als Secondary vorbereitet.
- AXFR/Zone-Transfer von dns-auth-01 zu dns-auth-02 wurde aktiviert.
- TCP 53 und UDP 53 sind auf dns-auth-01 verfügbar.
- ns2.home.app wurde angelegt.
- ns2.home.app zeigt auf 192.168.1.8.
- ns2.home.app ist auf dns-auth-01 und dns-auth-02 auflösbar.
- Zone home.app wird erfolgreich auf dns-auth-02 synchronisiert.
