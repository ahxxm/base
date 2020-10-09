#!/bin/sh

if ! id qbittorrent; then
    echo "[INFO] create user qbittorrent."
    groupadd -g $CHGID -o qbittorrent
    useradd -d /config -u $CHUID -g $CHGID -o qbittorrent
    if [ -d /config ]; then
        echo "[INFO] fix configs permission."
        chown -R $CHUID:$CHGID /config
    fi
fi

if [ ! -f /config/qBittorrent/qBittorrent.conf ]; then
    echo "[INFO] generate default config."
    mkdir -p /config/qBittorrent/
    cp /etc/opt/qBittorrent.conf /config/qBittorrent/qBittorrent.conf
    chown $CHUID:$CHGID /config/qBittorrent/qBittorrent.conf
fi

su qbittorrent -c "HOME=/config XDG_CONFIG_HOME=/config XDG_DATA_HOME=/config qbittorrent-nox --webui-port=$WEBUI_PORT"