FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ENV DEBIAN_FRONTEND noninteractive

ARG user=icecast2
ARG group=icecast

#RUN groupadd -r ${group} && useradd --no-log-init -r -g ${user} ${group}
RUN useradd -ms /bin/bash ${user} && groupadd ${group}

#ADD sources.list /etc/apt/

# RUN apt-get -qq -y update \
#     && apt-get -y install wget \
#     && wget -qO - http://icecast.org/multimedia-obs.key | sudo apt-key add -
    
# RUN echo "deb http://download.opensuse.org/repositories/multimedia:/xiph/Debian_8.0/ ./" > /etc/apt/sources.list.d/icecast.list

RUN apt-get -qq -y update \
    && apt-get --no-install-recommends -qq -y -f install build-essential devscripts autotools-dev fakeroot dpkg-dev debhelper autotools-dev dh-make quilt ccache libsamplerate0-dev libpulse-dev libaudio-dev lame libjack-jackd2-dev libasound2-dev libtwolame-dev libfaad-dev libflac-dev libmp4v2-dev libshout3-dev libmp3lame-dev \
    && apt-get -qq -y install icecast2 \
    && apt-get clean

COPY silence.ogg /usr/share/icecast2/silence.ogg
COPY icecast.xml /usr/share/icecast2/icecast.xml

RUN mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast2 \
    && chown -R ${user}:${group} /var/log/icecast

EXPOSE 8000

USER ${user}
CMD ["icecast2", "-c", "/usr/share/icecast2/icecast.xml"]