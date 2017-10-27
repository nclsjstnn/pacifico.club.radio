FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

# https://docs.docker.com/engine/reference/builder/#arg
ARG user=mpd
ARG group=audio

RUN useradd -ms /bin/bash ${user} && groupadd ${group}

RUN apt-get -qq -y update  \
    && apt-get -qq -y install mpd \
    && apt-get -qq -y install mpc \
    && apt-get clean

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/log/mpd/mpd.log \
    && chown -R ${user}:${group} /var/lib/mpd \
    && chown -R ${user}:${group} /var/log/mpd/mpd.log

# Declare a music , playlists and database volume (state, tag_cache and sticker.sql)
VOLUME ["/var/lib/mpd/music", "/var/lib/mpd/playlists", "/var/lib/mpd/database"]
COPY mpd.conf /etc/mpd.conf

# Entry point for mpc update and stuff
EXPOSE 6600

USER ${user}
CMD ["mpd", "--stdout", "--no-daemon"]
