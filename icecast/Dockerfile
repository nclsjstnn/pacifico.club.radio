FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ARG user=icecast2
ARG group=icecast

RUN useradd -ms /bin/bash ${user} && groupadd ${group}

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends icecast2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY silence.ogg /usr/share/icecast2/silence.ogg
COPY icecast.xml /usr/share/icecast2/icecast.xml

RUN mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast2 \
    && chown -R ${user}:${group} /var/log/icecast

USER ${user}
CMD ["icecast2", "-c", "/usr/share/icecast2/icecast.xml"]