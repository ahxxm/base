FROM alpine:3

# credit to https://github.com/caoli5288/docker-qbittorrent-nox/blob/master/Dockerfile
# only replaced binary with static musl build
# /config includes 2 directories: `data` and `qBittorrent`
# /downloads is default path

# groupadd and useradd
RUN apk add --no-cache shadow

# https://github.com/userdocs/qbittorrent-nox-static/releases/
# x86_64 prefix
# chmod +x qbittorrent-nox
ADD qbittorrent-nox /usr/bin/

# wget https://raw.githubusercontent.com/caoli5288/docker-qbittorrent-nox/master/qBittorrent.conf
ADD qBittorrent.conf /etc/opt/qBittorrent.conf

# wget https://github.com/caoli5288/docker-qbittorrent-nox/raw/master/entrypoint.sh
# chmod +x entrypoint.sh
ADD entrypoint.sh /entrypoint.sh

ENV WEBUI_PORT=8080 CHUID=1000 CHGID=1000

EXPOSE 6881 6881/udp 8080

ENTRYPOINT ["/entrypoint.sh"]
