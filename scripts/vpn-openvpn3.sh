#!/usr/bin/env bash

connection_status() {
    connection=$(openvpn3 sessions-list 2>/dev/null | sed -n '5 p' | sed 's#.*/##' | sed 's/\s.*$//')

    if [ "$connection" = "$config" ]; then
        echo "1"
    else
        echo "2"
    fi
}

config="profile-21.ovpn"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        openvpn3 session-manage --config "$HOME/Hemolens/scripts/$config" --disconnect
    else
        openvpn3 session-start --config "$HOME/Hemolens/scripts/$config"
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo "%{F#66ff66}廬 VPN"
    else
        echo "%{F#666666} VPN"
    fi
    ;;
esac
