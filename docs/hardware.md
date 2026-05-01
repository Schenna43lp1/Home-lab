# Hardware-Dokumentation

Stand: 01.05.2026

## Übersicht

| Node | IP | CPU | Kerne/Threads | RAM | Systemdisk | Zusatzdisk | Rolle |
|---|---:|---|---:|---:|---:|---:|---|
| pve01 | 192.168.1.11 | Intel Core i5-650 @ 3.20GHz | 2C / 4T | 7.6 GiB | 447.1 GB | - | PBS, Uptime Kuma, MariaDB01 |
| pve02 | 192.168.1.12 | Intel Core i7-4790 @ 3.60GHz | 4C / 8T | 15 GiB | 111.8 GB | 931.5 GB | Haupt-Service-Node |
| pve03 | 192.168.1.13 | Intel Core i5-7600K @ 3.80GHz | 4C / 4T | 15 GiB | 223.6 GB | 931.5 GB | DNS, NetBox, Proxy, MariaDB03 |

---

# PVE01

## Basisdaten

| Feld | Wert |
|---|---|
| Hostname | pve01 |
| IP | 192.168.1.11 |
| Rolle | Backup / Monitoring / Datenbank |
| Hersteller | To Be Filled By O.E.M. |
| Produkt | To Be Filled By O.E.M. |
| Seriennummer | To Be Filled By O.E.M. |

## CPU

| Feld | Wert |
|---|---|
| Modell | Intel Core i5 CPU 650 @ 3.20GHz |
| Sockets | 1 |
| Kerne pro Socket | 2 |
| Threads pro Kern | 2 |
| Gesamt | 2 Kerne / 4 Threads |

## RAM

| Feld | Wert |
|---|---|
| Gesamt | 7.6 GiB |
| Verwendet | 2.4 GiB |
| Frei | 523 MiB |
| Verfügbar | 5.2 GiB |
| Swap | 7.7 GiB |
| RAM-Module | 2 × 4 GB |
| Maximal laut System | 16 GB |

## Storage

| Disk | Größe | Typ | Nutzung |
|---|---:|---|---|
| sda | 447.1 GB | Disk / LVM | Proxmox System + VMs/CTs |

### LVM

| Volume | Größe | Zweck |
|---|---:|---|
| pve-root | 96 GB | Root-Dateisystem |
| pve-swap | 7.7 GB | Swap |
| pve-data | 319.8 GB | VM/CT Storage |

### Wichtige Volumes

| Volume | Größe |
|---|---:|
| pve-vm--100--disk--0 | 10 GB |
| pve-vm--100--disk--1 | 100 GB |
| pve-vm--102--disk--0 | 20 GB |
| pve-vm--105--disk--0 | 20 GB |

## Netzwerk

| Interface | Status | IP |
|---|---|---|
| ens133 | UP | - |
| vmbr0 | UP | 192.168.1.11/24 |
| lo | UNKNOWN | 127.0.0.1/8 |

## Bewertung

pve01 ist wichtig, weil dort der Proxmox Backup Server, Uptime Kuma und MariaDB01 laufen.  
RAM ist mit 7.6 GiB eher knapp. Für langfristigen Betrieb wäre ein Upgrade auf 16 GB sinnvoll.

---

# PVE02

## Basisdaten

| Feld | Wert |
|---|---|
| Hostname | pve02 |
| IP | 192.168.1.12 |
| Rolle | Haupt-Service-Node |
| Hersteller | FUJITSU |
| Produkt | ESPRIMO P920 |
| Seriennummer | YLPS030007 |

## CPU

| Feld | Wert |
|---|---|
| Modell | Intel Core i7-4790 @ 3.60GHz |
| Sockets | 1 |
| Kerne pro Socket | 4 |
| Threads pro Kern | 2 |
| Gesamt | 4 Kerne / 8 Threads |

## RAM

| Feld | Wert |
|---|---|
| Gesamt | 15 GiB |
| Verwendet | 6.2 GiB |
| Frei | 3.5 GiB |
| Verfügbar | 9.3 GiB |
| Swap | 8.0 GiB |
| Swap verwendet | 4.2 GiB |
| RAM-Module | 2 × 8 GB |
| Geschwindigkeit | 1600 MT/s |

## Storage

| Disk | Größe | Typ | Nutzung |
|---|---:|---|---|
| sda | 111.8 GB | Disk / LVM | Proxmox System |
| sdb | 931.5 GB | Disk / LVM | Container-/VM-Daten |
| sdc-sdf | 0 B | Disk | Leere/fehlerhafte Reader/Slots oder nicht nutzbar |
| sr0 | 1024 MB | ROM | Optisches Laufwerk |

### System-LVM auf sda

| Volume | Größe | Zweck |
|---|---:|---|
| pve-root | 37.7 GB | Root-Dateisystem |
| pve-swap | 8 GB | Swap |
| pve-data | 49.3 GB | VM/CT Storage |

### HDD-LVM auf sdb

| Volume | Größe |
|---|---:|
| hdd-vm--101--disk--0 | 28 GB |
| hdd-vm--102--disk--0 | 10 GB |
| hdd-vm--103--disk--0 | 10 GB |
| hdd-vm--104--disk--0 | 8 GB |
| hdd-vm--105--disk--0 | 12 GB |
| hdd-vm--106--disk--0 | 20 GB |
| hdd-vm--108--disk--0 | 10 GB |
| hdd-vm--109--disk--0 | 2 GB |
| hdd-vm--110--disk--0 | 10 GB |
| hdd-vm--111--disk--0 | 10 GB |
| hdd-vm--113--disk--0 | 20 GB |
| hdd-vm--114--disk--0 | 32 GB |
| hdd-vm--115--disk--0 | 8 GB |
| hdd-vm--116--disk--0 | 20 GB |
| hdd-vm--117--disk--0 | 8 GB |

## Netzwerk

| Interface | Status | IP |
|---|---|---|
| enp0s25 | UP | - |
| vmbr0 | UP | 192.168.1.12/24 |
| lo | UNKNOWN | 127.0.0.1/8 |

## Bewertung

pve02 ist aktuell dein Haupt-Service-Node.  
Er hat die stärkste CPU der drei Nodes und viel aktive Last. Auffällig ist die hohe Swap-Nutzung von 4.2 GiB. Das ist nicht sofort kritisch, aber ein Zeichen, dass RAM-Aufrüstung sinnvoll wäre.

Empfehlung: pve02 auf 32 GB RAM ausbauen, falls möglich.

---

# PVE03

## Basisdaten

| Feld | Wert |
|---|---|
| Hostname | pve3 |
| IP | 192.168.1.13 |
| Rolle | Infrastruktur / DNS / NetBox / Backup / Proxy |
| Hersteller | System manufacturer |
| Produkt | System Product Name |
| Seriennummer | System Serial Number |

## CPU

| Feld | Wert |
|---|---|
| Modell | Intel Core i5-7600K @ 3.80GHz |
| Sockets | 1 |
| Kerne pro Socket | 4 |
| Threads pro Kern | 1 |
| Gesamt | 4 Kerne / 4 Threads |

## RAM

| Feld | Wert |
|---|---|
| Gesamt | 15 GiB |
| Verwendet | 5.6 GiB |
| Frei | 594 MiB |
| Verfügbar | 9.9 GiB |
| Swap | 8.0 GiB |
| Swap verwendet | 134 MiB |
| RAM-Module | 2 × 8 GB |
| Geschwindigkeit | 2400 MT/s |

## Storage

| Disk | Größe | Typ | Nutzung |
|---|---:|---|---|
| sda | 223.6 GB | Disk / LVM | Proxmox System |
| sdb | 931.5 GB | Disk / LVM | Container-/VM-Daten |
| sr0 | 1024 MB | ROM | Optisches Laufwerk |

### System-LVM auf sda

| Volume | Größe | Zweck |
|---|---:|---|
| pve-root | 65.6 GB | Root-Dateisystem |
| pve-swap | 8 GB | Swap |
| pve-data | 130.3 GB | VM/CT Storage |

### HDD-LVM auf sdb

| Volume | Größe |
|---|---:|
| local--hdd-vm--100--disk--0 | 5 GB |
| local--hdd-vm--102--disk--0 | 20 GB |
| local--hdd-vm--103--disk--0 | 8 GB |
| local--hdd-vm--104--disk--0 | 8 GB |
| local--hdd-vm--105--disk--0 | 40 GB |
| local--hdd-vm--106--disk--0 | 10 GB |
| local--hdd-vm--107--disk--0 | 10 GB |
| local--hdd-vm--109--disk--0 | 16 GB |
| local--hdd-vm--110--disk--0 | 40 GB |

## Netzwerk

| Interface | Status | IP |
|---|---|---|
| nic0 | UP | - |
| wlp3s0 | DOWN | - |
| vmbr0 | UP | 192.168.1.13/24 |
| lo | UNKNOWN | 127.0.0.1/8 |

## Bewertung

pve03 ist dein Infrastruktur-Node.  
CPU und RAM sind für DNS, NetBox, Proxy, DB-Backup und MariaDB03 aktuell okay. Die zweite 1-TB-Disk ist nützlich für Containerdaten.

---

# Vergleich

## CPU

| Node | CPU | Kerne | Threads | Bewertung |
|---|---|---:|---:|---|
| pve01 | i5-650 | 2 | 4 | Alt / schwach |
| pve02 | i7-4790 | 4 | 8 | Stärkste CPU |
| pve03 | i5-7600K | 4 | 4 | Gute Single-Core-Leistung |

## RAM

| Node | RAM | Swap-Nutzung | Bewertung |
|---|---:|---:|---|
| pve01 | 7.6 GiB | 1.0 GiB | Knapp |
| pve02 | 15 GiB | 4.2 GiB | RAM-Upgrade empfohlen |
| pve03 | 15 GiB | 134 MiB | OK |

## Storage

| Node | Systemdisk | Zusatzdisk | Bewertung |
|---|---:|---:|---|
| pve01 | 447.1 GB | - | Einfach, aber ausreichend |
| pve02 | 111.8 GB | 931.5 GB | Gut, aber Systemdisk klein |
| pve03 | 223.6 GB | 931.5 GB | Gut |

---

# Empfehlungen

## Kurzfristig

- [ ] pve02 Swap-Nutzung beobachten
- [ ] pve01 RAM-Auslastung beobachten
- [ ] pve02 und pve03 SMART-Werte der 1-TB-Disks prüfen
- [ ] Seriennummern/Herstellerdaten bei pve01 und pve03 manuell ergänzen
- [ ] pve02 RAM-Upgrade auf 32 GB prüfen

## Mittelfristig

- [ ] pve01 ersetzen oder aufrüsten
- [ ] Einheitliches Storage-Konzept für alle Nodes definieren
- [ ] 10-Gbit-Netzwerk für Storage/Backup prüfen
- [ ] Dedizierten PBS-Host prüfen, damit PBS nicht auf pve01 läuft

---

# Nützliche Hardware-Befehle

## CPU

```bash
lscpu