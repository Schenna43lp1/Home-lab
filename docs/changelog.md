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