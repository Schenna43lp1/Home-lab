# Netzwerkdiagramm

Stand: 01.05.2026

```mermaid
flowchart TB
    Internet((Internet))
    Router["Router / Gateway<br>192.168.1.1"]

    Internet --> Router

    subgraph LAN["Homelab LAN 192.168.1.0/24"]
        Router --> PVE01["pve01<br>192.168.1.11"]
        Router --> PVE02["pve02<br>192.168.1.12"]
        Router --> PVE03["pve03<br>192.168.1.13"]

        subgraph PVE01_CT["PVE01 Container"]
            PBS["CT100 PBS<br>192.168.1.19"]
            UK["CT102 Uptime Kuma<br>192.168.1.4"]
            MDB01["CT105 MariaDB01<br>192.168.1.60"]
        end

        subgraph PVE02_CT["PVE02 Container"]
            MON["CT100 docker-Monitoring<br>192.168.1.21"]
            WEB["CT101 web-home<br>192.168.1.30"]
            RPROXY["CT102 Reverse Proxy<br>192.168.1.22"]
            GIT["CT103 git.app.home<br>192.168.1.31"]
            ANS["CT104 ansible<br>192.168.1.44"]
            ADG["CT105 AdGuard<br>192.168.1.5"]
            PDM["CT108 PDM<br>192.168.1.92"]
            NODEJS["CT110 nodjs-dev<br>192.168.1.81"]
            TERMIX["CT111 termix<br>192.168.1.82"]
            MDB02["CT113 MariaDB02<br>192.168.1.61"]
            PROXY02["CT115 proxy02<br>192.168.1.24"]
            OMADA["CT116 Omada<br>192.168.1.189"]
            PWI["CT117 proxy-wi-01<br>192.168.1.28"]
        end

        subgraph PVE03_CT["PVE03 Container"]
            BESZEL["CT100 Beszel<br>192.168.1.170"]
            PATCH["CT101 Patchmon<br>192.168.1.79"]
            MDB03["CT102 MariaDB03<br>192.168.1.62"]
            ADM["CT103 admiral<br>192.168.1.69"]
            DNS01["CT104 dns01<br>192.168.1.6 / 192.168.1.20"]
            MAIL["CT105 mailarchive01<br>192.168.1.125"]
            PDNS["CT106 PowerDNS<br>192.168.1.9"]
            NETBOX["CT107 NetBox<br>192.168.1.25"]
            HA["CT109 Home Assistant<br>192.168.1.18"]
            DBB["CT110 db-backup01<br>192.168.1.200"]
            PROXY01["CT113 proxy01<br>192.168.1.23<br>VIP 192.168.1.26"]
        end
    end

    PVE01 --> PBS
    PVE01 --> UK
    PVE01 --> MDB01

    PVE02 --> MON
    PVE02 --> WEB
    PVE02 --> RPROXY
    PVE02 --> GIT
    PVE02 --> ANS
    PVE02 --> ADG
    PVE02 --> PDM
    PVE02 --> NODEJS
    PVE02 --> TERMIX
    PVE02 --> MDB02
    PVE02 --> PROXY02
    PVE02 --> OMADA
    PVE02 --> PWI

    PVE03 --> BESZEL
    PVE03 --> PATCH
    PVE03 --> MDB03
    PVE03 --> ADM
    PVE03 --> DNS01
    PVE03 --> MAIL
    PVE03 --> PDNS
    PVE03 --> NETBOX
    PVE03 --> HA
    PVE03 --> DBB
    PVE03 --> PROXY01

    MDB01 <--> MDB02
    MDB02 <--> MDB03
    MDB03 <--> MDB01

    PROXY01 -. Keepalived / HA .- PROXY02
    PROXY01 -. VIP 192.168.1.26 .- RPROXY

    PBS -. Backups .- PVE01
    PBS -. Backups .- PVE02
    PBS -. Backups .- PVE03

    MON -. Monitoring .- PVE01
    MON -. Monitoring .- PVE02
    MON -. Monitoring .- PVE03
    UK -. Uptime Checks .- RPROXY
    UK -. Uptime Checks .- ADG
    UK -. Uptime Checks .- MDB01
    UK -. Uptime Checks .- MDB02
    UK -. Uptime Checks .- MDB03