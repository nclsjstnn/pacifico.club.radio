FROM resin/raspberrypi3-debian:latest
LABEL maintainer="n.justiniano@gmail.com"

# https://docs.docker.com/engine/reference/builder/#arg
ARG user=mpd

RUN useradd -ms /bin/bash ${user}
    
RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends wget mpd mpc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME [ "/var/lib/mpd/music", "/var/lib/mpd/playlists", "/var/lib/mpd/database" ]

# RUN mkdir -p /var/lib/mpd/music \
#     && mkdir -p /var/lib/mpd/playlists \
#     && mkdir -p /var/lib/mpd/database

    RUN chown -R ${user} /var/lib/mpd \
    && chown -R ${user} /var/lib/mpd/music \
        && chown -R ${user} /var/lib/mpd/playlists \
    && chown -R ${user} /var/lib/mpd/database 

RUN chmod g+w /var/lib/mpd/music /var/lib/mpd/playlists /var/lib/mpd/database

COPY mpd.conf /etc/mpd.conf

USER ${user}

ENV INITSYSTEM on

CMD ["mpd", "--stdout", "--no-daemon"]
