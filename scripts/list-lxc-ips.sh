#!/bin/bash
# list-lxc-ips.sh
# Zeigt VMID, Status, Name und LAN-IPs aller LXC-Container auf einem Proxmox-Node.

printf "%-6s %-10s %-30s %-40s\n" "VMID" "STATUS" "NAME" "LAN-IP(s)"
printf "%-6s %-10s %-30s %-40s\n" "----" "------" "----" "---------"

for vmid in $(pct list | awk 'NR>1 {print $1}'); do
    status=$(pct status "$vmid" | awk '{print $2}')
    name=$(pct config "$vmid" | awk -F': ' '/^hostname:/ {print $2}')

    if [ "$status" = "running" ]; then
        ips=$(pct exec "$vmid" -- bash -c "hostname -I 2>/dev/null | tr ' ' '\n' | grep '^192\.168\.1\.' | tr '\n' ' '" 2>/dev/null)
        [ -z "$ips" ] && ips="keine LAN-IP gefunden"
    else
        ips="stopped"
    fi

    printf "%-6s %-10s %-30s %-40s\n" "$vmid" "$status" "$name" "$ips"
done
