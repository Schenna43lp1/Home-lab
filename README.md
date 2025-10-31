# Home-lab
# 🧠 Markus Stuefer — Homelab Dokumentation

Willkommen in der offiziellen Dokumentation meines privaten **Homelabs**.  
Dieses Repository enthält Netzpläne, Konfigurationen, Automatisierungen und Monitoring-Setups meiner Infrastruktur.

---

## 🌐 Netzwerkübersicht

> Vollständiger IP-Plan inkl. Hostnamen, Rollen und Status:  
> 👉 [**Homelab IP-Plan**](homelab-ip-plan.md)

**Subnetz:** `192.168.1.0/24`  
**Gateway:** `192.168.1.1`  
**DNS:** `192.168.1.5 (AdGuard)`  
**Verfügbare Hosts:** 254

---

## 🧩 Infrastrukturübersicht

| Kategorie | Beschreibung | Status |
|------------|---------------|--------|
| 🖥️ Virtualisierung | Proxmox Cluster (`pve01`, `pve02`) | ✅ aktiv |
| 🐳 Container | Docker Core, Docker Monitoring, Docker01 | ✅ aktiv |
| 🧭 Automation | Ansible Controller (`192.168.1.44`) | ✅ aktiv |
| 📊 Monitoring | Uptime Kuma, Grafana, InfluxDB, Wazuh | ✅ aktiv |
| 🌍 Webdienste | Reverse Proxy, Web-Home, Forgejo (git-lxc) | ✅ aktiv |
| 💾 Storage | NAS01 (ZFS-ähnlich / NFS-Freigabe) | ✅ aktiv |
| ⚙️ Netzwerk | Router, Switch Core, Switch Secondary | ✅ aktiv |

---

## 🛠️ Verwendete Tools & Technologien

- **Proxmox VE** – Virtualisierung & Clusterverwaltung  
- **Docker & Docker Compose** – Containerisierte Dienste  
- **Ansible** – Automatisierung & Provisionierung  
- **Grafana + InfluxDB** – Monitoring & Dashboards  
- **Wazuh** – Security / SIEM  
- **AdGuard Home** – DNS-Filter & Schutz  
- **Zoraxy / Nginx Proxy Manager** – Reverse Proxy  
- **Forgejo (Git-LXC)** – Git Hosting & DevOps  

---
