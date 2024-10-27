#!/bin/bash


# Este código se ejecuta en un bucle infinito, 
# pero debido a que se quiere que funcione
# dentro del applet CommandRunner, no es adecuado 
# para nuestro propósito actual. En su lugar, este código 
# es una versión destinada a ejecutarse en la terminal.



INTERFACE="wlp4s0"  # Cambiar a la interfaz de red que se desea monitorear

echo "Interfaz: $INTERFACE"
echo -e "Tiempo\t\tRecibido (KB/s)\tEnviado (KB/s)"

# Capturar los datos iniciales de enviados y recibidos
old_received=$(grep "$INTERFACE" /proc/net/dev | awk '{print $2}')
old_transmitted=$(grep "$INTERFACE" /proc/net/dev | awk '{print $10}')


while true; do
    
    sleep 1 # Esperar 1 segundo

    new_received=$(grep "$INTERFACE" /proc/net/dev | awk '{print $2}')
    new_transmitted=$(grep "$INTERFACE" /proc/net/dev | awk '{print $10}')
    
    received_kbps=$(( (new_received - old_received) / 1024 ))
    transmitted_kbps=$(( (new_transmitted - old_transmitted) / 1024 ))
    
    # Si los valores alcanzan mas de 1024 KB/s los convierte a MB/s
    if [ "$received_kbps" -gt 1024 ] || [ "$transmitted_kbps" -gt 1024 ]; then
        received_mbps=$(( received_kbps / 1024 ))
        transmitted_mbps=$(( transmitted_kbps / 1024 ))
        echo -e "▼${received_mbps} MB/s | ▲${transmitted_mbps} MB/s"
    else
        echo -e "▼${received_kbps} KB/s | ▲${transmitted_kbps} KB/s"
    fi
    
    # Actualizar los valores anteriores
    old_received=$new_received
    old_transmitted=$new_transmitted
done
