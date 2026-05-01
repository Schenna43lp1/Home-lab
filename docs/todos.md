# To-do-Liste

## Hoch

- [x] IP-Konflikt behoben: `nodjs-dev` und `mariadb02` hatten beide `192.168.1.61`.
- [x] Prüfen, ob alle MariaDB-Nodes korrekt erreichbar sind.
- [x] Backup-Jobs für alle kritischen Container prüfen.

## Mittel

- [ ] `asible` in `ansible` umbenennen.
- [ ] Container `de` prüfen und sprechend umbenennen.
- [ ] Gestoppte Container prüfen:
  - `web01`
  - `nt-monitoring`
  - `minio`
  - `apps01`
  - `test-db`
  - `proxy-wi-dev`
- [ ] NetBox mit aktuellem IP-Plan abgleichen.

## Niedrig

- [ ] Docker-Bridge-IPs aus Hauptdoku entfernen.
- [ ] Dienste mit URLs ergänzen.
- [ ] Monitoring-Checks je Dienst dokumentieren.
- [ ] Backup-Aufbewahrung je Dienst dokumentieren.
