# Homelab DNS-Dokumentation – `home.app`

Stand: 2026-05-02

Diese Datei dokumentiert die interne DNS-Zone `home.app` im Homelab.

## Ziel

Die interne Zone `home.app` wird genutzt, um Homelab-Hosts, Dienste und virtuelle IPs sauber per DNS anzusprechen.

Beispiele:

```text
pve01.home.app
mariadb.home.app
ipam.home.app
authentik.home.app
proxy.home.app
```

## DNS-Server

| Name | IP | Rolle |
|---|---:|---|
| `ns1.home.app` | `192.168.1.9` | PowerDNS Primary / Authoritative DNS |
| `ns2.home.app` | `192.168.1.8` | Secondary DNS / zweiter DNS |

### NS-Records

```dns
home.app.    3600    IN    NS    ns1.home.app.
home.app.    3600    IN    NS    ns2.home.app.
```

## Aktueller SOA-Record

Aktuell ist der SOA-Record noch unsauber:

```dns
home.app. 3600 IN SOA a.misconfigured.dns.server.invalid hostmaster.home.app 2026042808 10800 3600 604800 3600
```

### Zielwert

```dns
home.app. 3600 IN SOA ns1.home.app. hostmaster.home.app. 2026042808 10800 3600 604800 3600
```

Empfehlung: später in PowerDNS-Admin auf `ns1.home.app.` ändern.

---

## DNS-Records

### DNS / Infrastruktur

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `ns1.home.app` | A | 300 | `192.168.1.9` |
| `ns2.home.app` | A | 300 | `192.168.1.8` |

### Proxmox

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `pve01.home.app` | A | 300 | `192.168.1.11` |
| `pve02.home.app` | A | 300 | `192.168.1.12` |
| `pve03.home.app` | A | 300 | `192.168.1.13` |
| `pbs.home.app` | A | 300 | `192.168.1.19` |

### HAProxy / Keepalived

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `proxy01.home.app` | A | 300 | `192.168.1.23` |
| `proxy02.home.app` | A | 300 | `192.168.1.24` |
| `proxy.home.app` | A | 300 | `192.168.1.26` |

`proxy.home.app` zeigt auf die Keepalived-VIP `192.168.1.26`.

### MariaDB

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `mariadb.home.app` | A | 300 | `192.168.1.26` |
| `mariadb01.home.app` | A | 300 | `192.168.1.60` |
| `mariadb02.home.app` | A | 300 | `192.168.1.61` |
| `mariadb03.home.app` | A | 300 | `192.168.1.62` |

Konzept:

```text
Apps / Clients
  -> mariadb.home.app
  -> 192.168.1.26 VIP
  -> HAProxy
  -> MariaDB Nodes
```

Verwendung:

| DNS-Name | Zweck |
|---|---|
| `mariadb.home.app` | Für Anwendungen / Clients |
| `mariadb01.home.app` | Direkte Administration / Monitoring Node 1 |
| `mariadb02.home.app` | Direkte Administration / Monitoring Node 2 |
| `mariadb03.home.app` | Direkte Administration / Monitoring Node 3 |

### Webdienste / Tools

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `authentik.home.app` | A | 300 | `192.168.1.71` |
| `docker01.home.app` | A | 300 | `192.168.1.45` |
| `git.home.app` | A | 300 | `192.168.1.31` |
| `glpi.home.app` | A | 300 | `192.168.1.21` |
| `ipam.home.app` | A | 300 | `192.168.1.45` |
| `netbox.home.app` | A | 300 | `192.168.1.25` |
| `observium.home.app` | A | 300 | `192.168.1.215` |
| `omada.home.app` | A | 300 | `192.168.1.189` |
| `semaphore.home.app` | A | 300 | `192.168.1.44` |
| `vpn.home.app` | A | 300 | `192.168.1.222` |
| `web-home.home.app` | A | 300 | `192.168.1.30` |

---

## Komplette Tabelle

| Name | Typ | TTL | Ziel |
|---|---:|---:|---:|
| `authentik.home.app` | A | 300 | `192.168.1.71` |
| `docker01.home.app` | A | 300 | `192.168.1.45` |
| `git.home.app` | A | 300 | `192.168.1.31` |
| `glpi.home.app` | A | 300 | `192.168.1.21` |
| `ipam.home.app` | A | 300 | `192.168.1.45` |
| `mariadb.home.app` | A | 300 | `192.168.1.26` |
| `mariadb01.home.app` | A | 300 | `192.168.1.60` |
| `mariadb02.home.app` | A | 300 | `192.168.1.61` |
| `mariadb03.home.app` | A | 300 | `192.168.1.62` |
| `netbox.home.app` | A | 300 | `192.168.1.25` |
| `ns1.home.app` | A | 300 | `192.168.1.9` |
| `ns2.home.app` | A | 300 | `192.168.1.8` |
| `observium.home.app` | A | 300 | `192.168.1.215` |
| `omada.home.app` | A | 300 | `192.168.1.189` |
| `pbs.home.app` | A | 300 | `192.168.1.19` |
| `proxy.home.app` | A | 300 | `192.168.1.26` |
| `proxy01.home.app` | A | 300 | `192.168.1.23` |
| `proxy02.home.app` | A | 300 | `192.168.1.24` |
| `pve01.home.app` | A | 300 | `192.168.1.11` |
| `pve02.home.app` | A | 300 | `192.168.1.12` |
| `pve03.home.app` | A | 300 | `192.168.1.13` |
| `semaphore.home.app` | A | 300 | `192.168.1.44` |
| `vpn.home.app` | A | 300 | `192.168.1.222` |
| `web-home.home.app` | A | 300 | `192.168.1.30` |

---

## PowerDNS-Befehle

### Alle Zonen anzeigen

```bash
pdnsutil list-all-zones
```

### Zone anzeigen

```bash
pdnsutil list-zone home.app
```

### Nur A-Records schöner anzeigen

```bash
pdnsutil list-zone home.app | awk '
/ IN A / {
  printf "%-28s %-6s %-6s %s\n", $1, $2, $4, $5
}'
```

### Doppelte A-Records finden

```bash
pdnsutil list-zone home.app | awk '/ IN A / {print $1}' | sort | uniq -d
```

Wenn nichts ausgegeben wird, gibt es keine doppelten A-Records.

### Record hinzufügen

Bei dieser PowerDNS-Version wird der vollständige FQDN mit Punkt am Ende verwendet:

```bash
pdnsutil add-record home.app test.home.app. A 300 192.168.1.100
```

### Record löschen

```bash
pdnsutil delete-rrset home.app test.home.app. A
```

### Record ändern

PowerDNS hat kein klassisches Ändern. Man löscht den alten Record und legt ihn neu an.

Beispiel:

```bash
pdnsutil delete-rrset home.app mariadb.home.app. A
pdnsutil add-record home.app mariadb.home.app. A 300 192.168.1.26
```

---

## DNS testen

### Mit `dig`

```bash
dig @192.168.1.9 pve01.home.app A +short
dig @192.168.1.9 mariadb.home.app A +short
dig @192.168.1.9 ipam.home.app A +short
```

Erwartung:

```text
192.168.1.11
192.168.1.26
192.168.1.45
```

### Mit `nslookup`

```bash
nslookup pve01.home.app 192.168.1.9
nslookup mariadb.home.app 192.168.1.9
```

---

## phpIPAM-Integration

phpIPAM ist erreichbar über:

```text
ipam.home.app
```

Aktueller DNS-Record:

```dns
ipam.home.app. 300 IN A 192.168.1.45
```

In phpIPAM sollte unter `Administration -> Nameservers` folgendes Nameserver-Set gepflegt werden:

| Feld | Wert |
|---|---|
| Name | `HomeLab DNS` |
| Nameserver 1 | `192.168.1.9` |
| Nameserver 2 | `192.168.1.8` |

Google-DNS wie `8.8.8.8` und `8.8.4.4` sind für interne `home.app`-Namen nicht sinnvoll.

---

## Empfohlene Struktur in phpIPAM

### Section

```text
HomeLab
```

### Subnet

```text
192.168.1.0/24
Beschreibung: Main LAN / Homelab
```

### Wichtige IPs

| IP | DNS / Beschreibung |
|---:|---|
| `192.168.1.1` | Router |
| `192.168.1.8` | `ns2.home.app` |
| `192.168.1.9` | `ns1.home.app` |
| `192.168.1.11` | `pve01.home.app` |
| `192.168.1.12` | `pve02.home.app` |
| `192.168.1.13` | `pve03.home.app` |
| `192.168.1.19` | `pbs.home.app` |
| `192.168.1.21` | `glpi.home.app` |
| `192.168.1.23` | `proxy01.home.app` |
| `192.168.1.24` | `proxy02.home.app` |
| `192.168.1.25` | `netbox.home.app` |
| `192.168.1.26` | `proxy.home.app` / `mariadb.home.app` VIP |
| `192.168.1.30` | `web-home.home.app` |
| `192.168.1.31` | `git.home.app` |
| `192.168.1.44` | `semaphore.home.app` |
| `192.168.1.45` | `docker01.home.app` / `ipam.home.app` |
| `192.168.1.60` | `mariadb01.home.app` |
| `192.168.1.61` | `mariadb02.home.app` |
| `192.168.1.62` | `mariadb03.home.app` |
| `192.168.1.71` | `authentik.home.app` |
| `192.168.1.189` | `omada.home.app` |
| `192.168.1.215` | `observium.home.app` |
| `192.168.1.222` | `vpn.home.app` |

---

## Namenskonzept

### Echte Hosts

Echte Hosts bekommen direkte A-Records:

```text
pve01.home.app
pve02.home.app
docker01.home.app
mariadb01.home.app
```

### Virtuelle Dienste / VIPs

Virtuelle Services zeigen auf eine VIP:

```text
proxy.home.app     -> 192.168.1.26
mariadb.home.app   -> 192.168.1.26
```

### Dienste auf Hosts

Services können eigene DNS-Namen bekommen:

```text
ipam.home.app -> 192.168.1.45
```

Später kann das sauberer über Reverse Proxy laufen:

```text
ipam.home.app -> 192.168.1.26 -> Reverse Proxy -> Docker Service
```

---

## Nächste To-dos

1. SOA-Record von `a.misconfigured.dns.server.invalid` auf `ns1.home.app.` ändern.
2. Entscheiden, welche Webdienste direkt auf Hosts zeigen und welche über die Proxy-VIP laufen sollen.
3. DNS-Zone regelmäßig exportieren und versionieren.
4. phpIPAM mit den aktuellen IPs pflegen.

## Zone exportieren

```bash
pdnsutil list-zone home.app > /backup/home.app.zone
```

Mit Datum:

```bash
pdnsutil list-zone home.app > /backup/home.app-$(date +%F).zone
```
