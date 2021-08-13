#!/bin/sh

connection_status() {
    connection=$(sudo wg show "$config" 2>/dev/null | head -n 1 | awk '{print $NF }')

    if [ "$connection" = "$config" ]; then
        echo "1"
    else
        echo "2"
    fi
}

config="kkrysiak"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        sudo wg-quick down "$config" 2>/dev/null
    else
        sudo wg-quick up "$config" 2>/dev/null
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo "%{F#66ff66}  VPN"
    else
        echo "%{F#666666} VPN"
    fi
    ;;
esac
