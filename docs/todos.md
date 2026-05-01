# To-do-Liste

## Hoch

- [x] IP-Konflikt beheben: `nodjs-dev` und `mariadb02` hatten beide `192.168.1.61`.
- [x] Neue IP von `nodjs-dev` in `docs/container-uebersicht.md`, `docs/ip-plan.md` und `data/ip-plan.csv` nachtragen.
- [x] Prüfen, ob alle MariaDB-Nodes korrekt erreichbar sind.
- [ ] Backup-Jobs für alle kritischen Container prüfen.

## Mittel

- [x] `asible` in `ansible` umbenennen.
- [ ] Container `de` prüfen und sprechend umbenennen.
- [ ] Gestoppte Container prüfen:
  - [ ] `web01`
  - [ ] `nt-monitoring`
  - [ ] `minio`
  - [ ] `apps01`
  - [ ] `test-db`
  - [ ] `proxy-wi-dev`
- [ ] NetBox mit aktuellem IP-Plan abgleichen.
- [ ] Für jeden kritischen Dienst Monitoring-Check dokumentieren.

## Niedrig

- [ ] Docker-Bridge-IPs aus Hauptdoku entfernen.
- [ ] Dienste mit URLs ergänzen.
- [ ] Backup-Aufbewahrung je Dienst dokumentieren.
- [ ] Screenshots oder Netzwerkdiagramm ergänzen.
