FROM resin/raspberrypi3-debian:latest

ENV INITSYSTEM on

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends wget mpd mpc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database

RUN chmod g+w /var/lib/mpd/music /var/lib/mpd/playlists /var/lib/mpd/database

COPY mpd.conf /etc/mpd.conf

CMD ["mpd", "--stdout", "--no-daemon"]

