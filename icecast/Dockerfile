FROM resin/raspberrypi3-alpine:3.4

ENV ICECAST_VERSION 2.4.3-r2

RUN apk -q update \
    && apk -q --no-progress add icecast="$ICECAST_VERSION" \
    && rm -rf /var/cache/apk/*

COPY silence.ogg /usr/share/icecast/silence.ogg
COPY icecast.xml /usr/share/icecast/icecast.xml

RUN mkdir -p /var/log/icecast \
    && chown -R root /usr/share/icecast \
    && chown -R root /var/log/icecast

CMD ["icecast", "-c", "/usr/share/icecast/icecast.xml"]