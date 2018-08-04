FROM resin/raspberrypi3-alpine:3.4

ENV ICECAST_VERSION 2.4.3-r2

ARG user=icecast
ARG group=icecast

RUN apk -q update \
    && apk -q --no-progress add icecast="$ICECAST_VERSION" \
    && rm -rf /var/cache/apk/*

COPY silence.ogg /usr/share/icecast/silence.ogg
COPY icecast.xml /usr/share/icecast/icecast.xml
COPY ./entry_icecast.sh ./

RUN mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast \
    && chown -R ${user}:${group} /var/log/icecast

ENTRYPOINT [ "./entry_icecast.sh" ]