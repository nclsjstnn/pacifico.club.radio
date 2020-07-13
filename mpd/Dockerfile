FROM balenalib/raspberry-pi-alpine:latest

RUN set -x && apk --no-cache add mpd mpc

RUN mkdir -p /var/lib/mpd/conf/ \
    && mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/lib/mpd/database/tag_cache \
    && mkdir -p /var/lib/mpd/database/state

RUN chown -R mpd:audio /var/lib/mpd && chown -R mpd:audio /var/lib/mpd/database

COPY mpd.conf /var/lib/mpd/conf/mpd.conf

VOLUME ["/var/lib/mpd/conf","/var/lib/mpd/music","/var/lib/mpd/playlists","/var/lib/mpd/database"]

ENTRYPOINT ["/usr/bin/mpd", "--no-daemon", "--stdout", "/var/lib/mpd/conf/mpd.conf"]
