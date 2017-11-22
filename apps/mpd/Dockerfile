FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

# https://docs.docker.com/engine/reference/builder/#arg
ARG user=mpd
ARG group=audio

RUN useradd -ms /bin/bash ${user}

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends wget mpd mpc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/log/mpd/mpd.log \
    && chown -R ${user} /var/lib/mpd \
    && chown -R ${user} /var/log/mpd/mpd.log \
    && chown -R ${user} /var/lib/mpd/music \
    && chown -R ${user} /var/lib/mpd/playlists \
    && chown -R ${user} /var/lib/mpd/database 

RUN chmod g+w /var/lib/mpd/music /var/lib/mpd/playlists /var/lib/mpd/database

COPY mpd.conf /etc/mpd.conf

USER ${user}

CMD ["mpd", "--stdout", "--no-daemon"]
