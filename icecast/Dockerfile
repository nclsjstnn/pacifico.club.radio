FROM resin/raspberrypi3-debian:latest

ENV INITSYSTEM on

ARG user=icecast2
ARG group=icecast

RUN useradd -ms /bin/bash ${user} && groupadd ${group}

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends icecast2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/icecast
# && mkdir -p /usr/share/icecast2 \
# && chown -R ${user}:${group} /usr/share/icecast2 \
# && chown -R ${user}:${group} /var/log/icecast

COPY silence.ogg /usr/share/icecast2/silence.ogg
COPY icecast.xml /usr/share/icecast2/icecast.xml

USER ${user}

CMD ["icecast2", "-c", "/usr/share/icecast2/icecast.xml"]
