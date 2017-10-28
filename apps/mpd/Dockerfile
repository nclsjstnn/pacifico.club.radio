FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

# https://docs.docker.com/engine/reference/builder/#arg
ARG user=mpd
ARG group=audio

RUN useradd -ms /bin/bash ${user}

RUN apt-get -qq -y update \
    && apt-get -qq -y install wget \
    && apt-get -qq -y install mpd \
    && apt-get -qq -y install mpc \
    && apt-get clean

# # Install mpd. We need the backports version because the default debian version crashes on certain characters when updating the DB
# # See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=768094
# RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list \
#  && apt-get update && apt-get -y -t jessie-backports install mpd mpc

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/log/mpd/mpd.log \
    && chown -R ${user} /var/lib/mpd \
    && chown -R ${user} /var/log/mpd/mpd.log \
    && chown -R ${user} /var/lib/mpd/music \
    && chown -R ${user} /var/lib/mpd/playlists \
    && chown -R ${user} /var/lib/mpd/database 

# Declare a music , playlists and database volume (state, tag_cache and sticker.sql)
# VOLUME ["/var/lib/mpd/music", "/var/lib/mpd/playlists", "/var/lib/mpd/database"]
COPY mpd.conf /etc/mpd.conf

# Entry point for mpc update and stuff
EXPOSE 6600

USER ${user}
CMD ["mpd", "--stdout", "--no-daemon"]
