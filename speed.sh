#!/bin/bash

INTERFACE="wlp4s0"


old_received=$(grep "$INTERFACE" /proc/net/dev | awk '{print $2}')
old_transmitted=$(grep "$INTERFACE" /proc/net/dev | awk '{print $10}')

sleep 1

new_received=$(grep "$INTERFACE" /proc/net/dev | awk '{print $2}')
new_transmitted=$(grep "$INTERFACE" /proc/net/dev | awk '{print $10}')


received_kbps=$(( (new_received - old_received) / 1024 ))
transmitted_kbps=$(( (new_transmitted - old_transmitted) / 1024 ))


if [ "$received_kbps" -gt 1024 ] || [ "$transmitted_kbps" -gt 1024 ]; then
    received_mbps=$(( received_kbps / 1024 ))
    transmitted_mbps=$(( transmitted_kbps / 1024 ))
    echo "▼${received_mbps} MB/s | ▲${transmitted_mbps} MB/s"
else
    echo "▼${received_kbps} KB/s | ▲${transmitted_kbps} KB/s"
fi
