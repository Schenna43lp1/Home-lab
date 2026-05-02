flowchart TD
    Internet((Internet))
    Router[Router / Gateway<br>192.168.1.1]
    Switch[Core Switch / LAN<br>192.168.1.0/24]

    Internet --> Router
    Router --> Switch

    Switch --> PVE01[pve01<br>i5-650<br>2C/4T<br>alt / schwach<br>Upgrade zuerst]
    Switch --> PVE02[pve02<br>i7-4790<br>4C/8T<br>stärkste CPU]
    Switch --> PVE03[pve03<br>i5-7600K<br>4C/4T<br>gute Single-Core]

    Switch --> PBS[PBS / Backup Server<br>192.168.1.19]
    Switch --> DNS[DNS / AdGuard / PowerDNS<br>192.168.1.5 / .6 / .9]
    Switch --> Proxy[Reverse Proxy / HAProxy<br>192.168.1.22 / VIP 192.168.1.26]
    Switch --> Monitoring[Monitoring<br>Uptime Kuma / Observium / Grafana]