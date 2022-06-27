#!/usr/bin/env bash

connection_status() {
    connection=$(/opt/forticlient/fortivpn status | head -2 | tail -1 | sed 's/.*: //g')

    if [ "$connection" = "$config" ]; then
        echo "1"
    else
        echo "2"
    fi
}

config="Hemolens SSL"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        /opt/forticlient/fortivpn disconnect 2>/dev/null
    else
        ~/LifeFlow/scripts/fortiexpect.sh 2>/dev/null
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
